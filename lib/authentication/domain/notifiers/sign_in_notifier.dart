import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/verify_phone_number_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/services/auth_service.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/state/sign_in_state.dart';

class SignInPhone extends StateNotifier<SignInState> {
  SignInPhone({
    required this.authService,
  }) : super(const SignInState.notValid());

  AuthService authService;

  // LibPhonenumberTextFormatter get phoneNumberFormatter {
  //   return LibPhonenumberTextFormatter(
  //     phoneNumberType: PhoneNumberType.mobile,
  //     phoneNumberFormat: PhoneNumberFormat.international,
  //     country: authService.selectedCountry,
  //     onFormatFinished: (inputText) async => _parsePhoneNumber(inputText),
  //   );
  // }

  // Future<void> _parsePhoneNumber(String inputText) async {
  //   try {
  //     await authService.parsePhoneNumber(inputText);
  //     state = SignInState.canSubmit();
  //   } catch (e) {
  //     if (!e.message.contains('parse')) {
  //       state = SignInState.error(e.message);
  //     } else {
  //       state = SignInState.notValid();
  //     }
  //   }
  // }

  Future<void> verifyPhone(String phoneNumber) async {
    state = const SignInState.loading();
    authService.verifyPhone(phoneNumber, () {
      state = const SignInState.success();
    }, (String message) {
      state = SignInState.error(message);
    });
  }
}
