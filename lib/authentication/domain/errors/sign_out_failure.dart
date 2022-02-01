import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

class SignOutFailure extends Failure {
  final String message;

  SignOutFailure({required this.message});

  @override
  List<Object?> get props => [message];
}