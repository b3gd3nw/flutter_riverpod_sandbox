import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

class VerifyPhoneNumberFailure extends Failure {
  final String message;

  VerifyPhoneNumberFailure({required this.message});

  @override
  List<Object?> get props => [message];
}