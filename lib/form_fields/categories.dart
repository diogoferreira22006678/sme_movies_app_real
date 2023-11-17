import 'package:formz/formz.dart';

enum CategoriesValidationError {
  invalid
}

class Categories extends FormzInput<String, CategoriesValidationError> {
  const Categories.pure() : super.pure('');

  const Categories.dirty(String value) : super.dirty(value);

  @override
  CategoriesValidationError? validator(String? value) {
    // Add your validation logic for categories
    return value?.isNotEmpty == true ? null : CategoriesValidationError.invalid;
  }
}
