import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

class UpdateUserFailure extends Failure {
  final String message;

  UpdateUserFailure({required this.message});

  @override
  List<Object?> get props => [message];
}