import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sme_movies_app/repository/movies_repository.dart';

import 'movie_add_form.dart';
import 'movie_add_form_cubit.dart';

class MovieAddPage extends StatelessWidget {
  const MovieAddPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MovieAddPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Movie")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider<MovieAddFormCubit>(
          create: (_) => MovieAddFormCubit(context.read<MoviesRepository>()),
          child: const MovieAddForm(),
        ),
      ),
    );
  }
}
