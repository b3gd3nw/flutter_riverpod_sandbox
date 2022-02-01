import 'package:dartz/dartz.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/entities/user_entity.dart';
import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

abstract class AbstractAuthenticationRepository {
  Future<Either<Failure, String>> verifyPhoneNumber({required String number});
  Future<Either<Failure, UserEntity>> confirmPhoneNumber(
      {required String smsCode});
  Either<Failure, void> updateUserInfo(
      {required String fName, required String lName, String? email});
  Future<Either<Failure, void>> signOut();
  Stream<UserEntity?> get user;
  String get phoneNumber;
}
