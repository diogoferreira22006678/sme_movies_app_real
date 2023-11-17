import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sme_movies_app/crudMovie/movie_add_page.dart';

import '../repository/movies_repository.dart';
import '../models/movies.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MoviesPage());
  }

  @override
  Widget build(BuildContext context) => RepositoryProvider(
        create: (_) => MoviesRepository(),
        child: Scaffold(
          appBar: AppBar(title: const Text("Movies home")),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder(
              future: context.read<MoviesRepository>().getAllMovies(),
              builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.movie),
                      title: Text(snapshot.data![index].title ?? ''),
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: snapshot.data?.length ?? 0,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push<void>(MovieAddPage.route());
            },
            child: const Icon(Icons.add),
          ),
        ),
      );
}
