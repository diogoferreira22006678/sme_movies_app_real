import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sme_movies_app/models/movies.dart';

class MoviesRepository {
  final FirebaseFirestore _firebaseFireStore;

  MoviesRepository({FirebaseFirestore? firebaseFireStore})
      : _firebaseFireStore = firebaseFireStore ?? FirebaseFirestore.instance;

  Future<List<Movie>> getAllMovies() {
    return _firebaseFireStore
        .collection("movies")
        .get()
        .asStream()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                Movie.fromJson({'uid': doc.reference.id, ...doc.data()})).toList())
        .single;
  }
}