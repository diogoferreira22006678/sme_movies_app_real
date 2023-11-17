import 'package:formz/formz.dart';

enum MovieTitleValidationError {
  invalid
}

class MovieTitle extends FormzInput<String, MovieTitleValidationError> {
  const MovieTitle.pure() : super.pure('');

  const MovieTitle.dirty(String value) : super.dirty(value);

  @override
  MovieTitleValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : MovieTitleValidationError.invalid;
  }
}
