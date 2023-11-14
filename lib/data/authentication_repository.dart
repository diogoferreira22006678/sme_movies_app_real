import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:sme_movies_app/business/models/user.dart';

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final CacheClient _cache;

  static const userCacheKey = '__userCacheKey__';

  AuthenticationRepository(
      {firebase_auth.FirebaseAuth? firebaseAuth, CacheClient? cache})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _cache = cache ?? CacheClient();

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

class CacheClient {
  final Map<String, Object> _cache;

  CacheClient() : _cache = <String, Object>{};

  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }
}