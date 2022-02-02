import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/verify_phone_number_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/services/auth_service.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/state/sign_in_state.dart';

class SignInPhone extends StateNotifier<PhoneSignInState> {
  SignInPhone({
    required this.authService,
  }) : super(PhoneSignInNotifierStateInitial());

  AuthService authService;

  Future<void> verifyPhone(String phoneNumber) async {
    state = PhoneSignInNotifierStateVerification(phoneNumber);
    authService.verifyPhone(phoneNumber, () {
      state = PhoneSignInNotifierStateVerificationSuccess(phoneNumber);
    }, (String message) {
      state = PhoneSignInNotifierStateVerificationFailed(phoneNumber, message);
    });
  }

  Future<void> verifyCode(String code) async {
    state = PhoneSignInNotifierStateConfirmation(code);
    authService.verifyCode(code, () {
      state = PhoneSignInNotifierStateConfirmationSuccess(code);
    }, (String message) {
      state = PhoneSignInNotifierStateConfirmationFailed(code, message);
    });
  }
}
