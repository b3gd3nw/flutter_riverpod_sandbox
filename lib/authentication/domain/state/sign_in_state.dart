import 'package:equatable/equatable.dart';

abstract class PhoneSignInState extends Equatable {}

class PhoneSignInNotifierStateInitial extends PhoneSignInState {
  @override
  List<Object?> get props => [];
}

class PhoneSignInNotifierStateVerification extends PhoneSignInState {
  final String phoneNumber;

  PhoneSignInNotifierStateVerification(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneSignInNotifierStateLoading extends PhoneSignInState {
  final String phoneNumber;

  PhoneSignInNotifierStateLoading(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneSignInNotifierStateVerificationSuccess extends PhoneSignInState {
  final String phoneNumber;

  PhoneSignInNotifierStateVerificationSuccess(this.phoneNumber) : super();

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneSignInNotifierStateVerificationFailed extends PhoneSignInState {
  final String phoneNumber;
  final String errorMessage;

  PhoneSignInNotifierStateVerificationFailed(
      this.phoneNumber, this.errorMessage)
      : super();

  @override
  List<Object?> get props => [phoneNumber, errorMessage];
}

class PhoneSignInNotifierStateConfirmation extends PhoneSignInState {
  final String code;

  PhoneSignInNotifierStateConfirmation(this.code);

  @override
  List<Object?> get props => [code];
}

class PhoneSignInNotifierStateConfirmationSuccess extends PhoneSignInState {
  final String code;

  PhoneSignInNotifierStateConfirmationSuccess(this.code);

  @override
  List<Object?> get props => [code];
}

class PhoneSignInNotifierStateConfirmationFailed extends PhoneSignInState {
  final String code;
  final String errorMessage;

  PhoneSignInNotifierStateConfirmationFailed(this.code, this.errorMessage);

  @override
  List<Object?> get props => [code, errorMessage];
}
