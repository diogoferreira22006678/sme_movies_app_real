import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:sme_movies_app/form_fields/title.dart';
import 'package:sme_movies_app/repository/movies_repository.dart';
import 'package:sme_movies_app/crudMovie/movie_add_form_state.dart';


class MovieAddFormCubit extends Cubit<MovieAddFormState> {
  final MoviesRepository _movieRepository;

  MovieAddFormCubit(this._movieRepository) : super(const MovieAddFormState());

  // Add your form field change methods and form submission method here
  void titleChanged(String value) {
    final title = MovieTitle.dirty(value);
    emit(state.copyWith(
      movieTitle: title,
      status: Formz.validate([
        title,
        state.trailerUrl,
        state.imageUrl,
        state.categories,
      ]),
    ));
  }


}
