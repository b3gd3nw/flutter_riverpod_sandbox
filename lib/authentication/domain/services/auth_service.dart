import 'package:flash/flash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/verify_phone_number_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/repositories/abstract_authentication_repository.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/state/auth_state.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/usecase/confirm_phone_number.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/usecase/verify_phone_number.dart';

class AuthService extends StateNotifier<AuthState> {
  final AbstractAuthenticationRepository repository;

  AuthService({
    required this.repository,
  }) : super(const AuthState.initializing()) {
    // _firebaseAuth = FirebaseAuth.instance;
    // _loadCountries();
  }

  // Stream<User> authStateChanges() => repository.user;
  // CountryWithPhoneCode get selectedCountry => _selectedCountry;
  // String get phoneCode => _selectedCountry.phoneCode;
  // String get formattedPhoneNumber => _phoneNumber['international'];

  Future<void> verifyPhone(
    String phoneNumber,
    Function() completion,
    Function(String message) error,
  ) async {
    print(phoneNumber);
    final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase =
        VerifyPhoneNumberUseCase(repository: repository);
    final res = await verifyPhoneNumberUseCase
        .execute(VerifyPhoneNumberUseCaseParams(number: phoneNumber));
    res.fold(
      (l) => error(l.props.first.toString()),
      (r) => completion(),
    );
  }

  Future<void> verifyCode(
    String smsCode,
    Function() completion,
    Function(String message) error,
  ) async {
    final ConfirmPhoneNumberUseCase confirmPhoneNumberUseCase =
        ConfirmPhoneNumberUseCase(repository: repository);
    final res = await confirmPhoneNumberUseCase
        .execute(ConfirmPhoneNumberUseCaseParams(smsCode: smsCode));
    res.fold(
      (l) => error(l.props.first.toString()),
      (r) => completion(),
    );
  }

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  // }
}
