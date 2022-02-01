import 'package:formz/formz.dart';
import 'package:freshcode_loyalty_t3/authentication/data/models/phone_model.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/utilities/validator.dart';
import 'package:riverpod/riverpod.dart';

class ValidateNotifier extends StateNotifier<Validator> {
  // We initialize the list of todos to an empty list
  ValidateNotifier() : super(Validator());

  void phoneChanged(String phone) {
    final dirtyPhone = Phone.dirty(phone);
    print(phone);
    state = state.copyWith(phone: dirtyPhone, status: Formz.validate([dirtyPhone]));
  }
}
