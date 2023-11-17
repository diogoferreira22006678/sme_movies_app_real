import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Import your form fields

import '../form_fields/title.dart';
import '../form_fields/image_url.dart';
import '../form_fields/trailer_url.dart';
import '../form_fields/categories.dart';

class MovieAddFormState extends Equatable {
  final MovieTitle movieTitle;
  final TrailerUrl trailerUrl;
  final ImageUrl imageUrl;
  final Categories categories;
  final FormzStatus status;
  final String? errorMessage;

  const MovieAddFormState({
    this.movieTitle = const MovieTitle.pure(),
    this.trailerUrl = const TrailerUrl.pure(),
    this.imageUrl = const ImageUrl.pure(),
    this.categories = const Categories.pure(),

    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  bool get isValid => status.isValidated && errorMessage == null;

  @override
  List<Object?> get props => [movieTitle, trailerUrl, imageUrl, categories, status, errorMessage];

  List<FormzInput> get inputs => [movieTitle, trailerUrl, imageUrl, categories];

  MovieAddFormState copyWith({
    MovieTitle? movieTitle,
    TrailerUrl? trailerUrl,
    ImageUrl? imageUrl,
    Categories? categories,

    FormzStatus? status,
    String? errorMessage,
  }) =>
      MovieAddFormState(
        movieTitle: movieTitle ?? this.movieTitle,
        trailerUrl: trailerUrl ?? this.trailerUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        categories: categories ?? this.categories,
        
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
