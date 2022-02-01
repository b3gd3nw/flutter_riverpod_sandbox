import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

class ConfirmPhoneNumberFailure extends Failure {
  final String message;

  ConfirmPhoneNumberFailure({required this.message});

  @override
  List<Object?> get props => [message];
}