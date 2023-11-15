import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sme_movies_app/repository/authentication_repository.dart';
import 'package:sme_movies_app/login/login_form.dart';
import 'package:sme_movies_app/login/login_form_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(MyApp(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;

  MyApp({super.key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => RepositoryProvider.value(
        value: _authenticationRepository,
        child: BlocProvider<LoginFormCubit>(
          create: (_) => LoginFormCubit(_authenticationRepository),
          child: const MyHomePage(),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Movies App',
        home: Scaffold(
          appBar: AppBar(title: const Text("Movies App")),
          body: const Padding(
            padding: EdgeInsets.all(16),
            child: LoginForm(),
          ),
        ),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      );
}