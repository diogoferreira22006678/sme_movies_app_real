import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_add_form_cubit.dart';
import 'movie_add_form_state.dart';

class MovieAddForm extends StatelessWidget {
  const MovieAddForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieAddFormCubit, MovieAddFormState>(
      listener: (context, state) {
        // Add your UI updates based on form submission status
      },
      child: Column(
        // Your UI widgets for movie form
      ),
    );
  }
}
