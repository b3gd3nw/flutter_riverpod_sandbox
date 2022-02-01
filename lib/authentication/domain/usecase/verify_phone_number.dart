import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/repositories/abstract_authentication_repository.dart';
import 'package:freshcode_loyalty_t3/core/errors/failure.dart';
import 'package:freshcode_loyalty_t3/core/use-case/use-case.dart';

class VerifyPhoneNumberUseCaseParams {
  final String number;

  VerifyPhoneNumberUseCaseParams({required this.number});
}

class VerifyPhoneNumberUseCaseReturn extends Equatable {
  final String verificationId;

  const VerifyPhoneNumberUseCaseReturn({required this.verificationId});

  @override
  List<Object?> get props => [verificationId];
}

class VerifyPhoneNumberUseCase extends UseCase<VerifyPhoneNumberUseCaseParams,
    VerifyPhoneNumberUseCaseReturn> {
  final AbstractAuthenticationRepository repository;

  VerifyPhoneNumberUseCase({required this.repository});

  @override
  Future<Either<Failure, VerifyPhoneNumberUseCaseReturn>> execute(
      VerifyPhoneNumberUseCaseParams params) async {
    var result = await repository.verifyPhoneNumber(number: params.number);
    return result.map((r) => VerifyPhoneNumberUseCaseReturn(verificationId: r));
  }
}
