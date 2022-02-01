import 'package:formz/formz.dart';

/// Validation errors for the [Phone] [FormzInput].
enum PhoneValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template phone}
/// Form input for an email input.
/// {@endtemplate}
class Phone extends FormzInput<String, PhoneValidationError> {
  /// {@macro phone}
  const Phone.pure() : super.pure('');

  /// {@macro phone}
  const Phone.dirty([String value = '']) : super.dirty(value);

  static final RegExp _phoneRegExp = RegExp(
    r'^(?:[0][1-9])?[0-9]{10,12}$',
  );

  @override
  PhoneValidationError? validator(String? value) {
    return (!_phoneRegExp.hasMatch(value ?? '') && value != '')
        ? null
        : PhoneValidationError.invalid;
  }
}
