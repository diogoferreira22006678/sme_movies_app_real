import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:sme_movies_app/repository/movies_repository.dart';
import '../form_fields/movie_title.dart'; 
import '../form_fields/release_date.dart'; 
import '../repository/movie_repository.dart'; 

class MovieAddFormCubit extends Cubit<MoviesAddFormState> {
  final MoviesRepository _movieRepository;

  MovieAddFormCubit(this._movieRepository) : super(const MovieAddsFormState());

  // Add your form field change methods and form submission method here
}
