import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Import your form fields

import '../form_fields/movie_title.dart';
import '../form_fields/release_date.dart';

class MovieAddFormState extends Equatable {
  final MovieTitle movieTitle;
  final ReleaseDate releaseDate;
  final FormzStatus status;
  final String? errorMessage;

  const MovieAddFormState({
    this.movieTitle = const MovieTitle.pure(),
    this.releaseDate = const ReleaseDate.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  // Add your methods or properties if needed

  @override
  List<Object?> get props => [movieTitle, releaseDate, status];

  List<FormzInput> get inputs => [movieTitle, releaseDate];

  MovieAddFormState copyWith({
    MovieTitle? movieTitle,
    ReleaseDate? releaseDate,
    FormzStatus? status,
    String? errorMessage,
  }) =>
      MovieAddFormState(
        movieTitle: movieTitle ?? this.movieTitle,
        releaseDate: releaseDate ?? this.releaseDate,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
