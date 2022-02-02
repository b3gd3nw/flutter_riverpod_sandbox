import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/entities/user_entity.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/repositories/abstract_authentication_repository.dart';
import 'package:freshcode_loyalty_t3/core/errors/failure.dart';
import 'package:freshcode_loyalty_t3/core/use-case/use-case.dart';


class ConfirmPhoneNumberUseCaseParams {
  final String smsCode;

  ConfirmPhoneNumberUseCaseParams({required this.smsCode});
}

class ConfirmPhoneNumberUseCaseReturn extends Equatable {
  final UserEntity user;

  ConfirmPhoneNumberUseCaseReturn({required this.user});

  @override
  List<Object?> get props => [user];
}

class ConfirmPhoneNumberUseCase extends UseCase<ConfirmPhoneNumberUseCaseParams,
    ConfirmPhoneNumberUseCaseReturn> {
  final AbstractAuthenticationRepository repository;

  ConfirmPhoneNumberUseCase({required this.repository});

  @override
  Future<Either<Failure, ConfirmPhoneNumberUseCaseReturn>> execute(
      ConfirmPhoneNumberUseCaseParams params) async {
    var result = await repository.confirmPhoneNumber(smsCode: params.smsCode);

    return result.map((r) => ConfirmPhoneNumberUseCaseReturn(user: r));
  }
}
