import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freshcode_loyalty/core/errors/failure.dart';
import 'package:freshcode_loyalty/core/use-case/use-case.dart';
import 'package:freshcode_loyalty/features/authentication/domain/entities/user_entity.dart';
import 'package:freshcode_loyalty/features/authentication/domain/repositories/abstract_authentication_repository.dart';

class SignOutUseCaseParams {
  SignOutUseCaseParams();
}

class SignOutUseCaseReturn extends Equatable {


  SignOutUseCaseReturn();

  @override
  List<Object?> get props => [];
}

class SignOutUseCase extends UseCase<SignOutUseCaseParams,
    SignOutUseCaseReturn> {
  final AbstractAuthenticationRepository repository;

  SignOutUseCase({required this.repository});

  Future<Either<Failure, SignOutUseCaseReturn>> execute(
      SignOutUseCaseParams params) async {
    var result = await repository.signOut();

    return result.map((r) => new SignOutUseCaseReturn());
  }
}
