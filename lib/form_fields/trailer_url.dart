import 'package:formz/formz.dart';

enum TrailerUrlValidationError {
  invalid
}

class TrailerUrl extends FormzInput<String, TrailerUrlValidationError> {
  const TrailerUrl.pure() : super.pure('');

  const TrailerUrl.dirty(String value) : super.dirty(value);

  @override
  TrailerUrlValidationError? validator(String? value) {
    // Add your validation logic for the trailer URL
    return value?.isNotEmpty == true ? null : TrailerUrlValidationError.invalid;
  }
}
