import 'package:formz/formz.dart';

enum ImageUrlValidationError {
  invalid
}

class ImageUrl extends FormzInput<String, ImageUrlValidationError> {
  const ImageUrl.pure() : super.pure('');

  const ImageUrl.dirty(String value) : super.dirty(value);

  @override
  ImageUrlValidationError? validator(String? value) {
    // Add your validation logic for the image URL
    return value?.isNotEmpty == true ? null : ImageUrlValidationError.invalid;
  }
}
