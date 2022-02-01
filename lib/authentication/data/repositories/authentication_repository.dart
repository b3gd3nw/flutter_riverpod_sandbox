import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/entities/user_entity.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/confirm_phone_number_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/sign_out_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/update_user_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/errors/verify_phone_number_failure.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/repositories/abstract_authentication_repository.dart';
import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

class AuthenticationRepository extends AbstractAuthenticationRepository {
  final FirebaseAuth _auth;
  String _verificationId = '';
  String _phoneNumber = '';
  User? _user;
  AuthenticationRepository({required FirebaseAuth auth}) : _auth = auth;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  @override
  Future<Either<Failure, UserEntity>> confirmPhoneNumber(
      {required String smsCode}) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: smsCode);
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      _user = userCredential.user;
      return Right(UserEntity(
          id: userCredential.user!.uid,
          email: userCredential.user!.email ?? 'your@email.com',
          displayName: userCredential.user!.displayName ?? '',
          phoneNumber: userCredential.user!.phoneNumber!));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-verification-code':
          return Left(ConfirmPhoneNumberFailure(message: 'Не вірний код'));
        default:
          return Left(ConfirmPhoneNumberFailure(message: 'Unhandled Error'));
      }
    }
  }

  @override
  Future<Either<Failure, String>> verifyPhoneNumber(
      {required String number}) async {
    _phoneNumber = number;
    final Completer _completer = Completer();
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      _verificationId = verificationID;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credentials) {
          _completer.complete(credentials);
        },
        verificationFailed: (FirebaseAuthException e) {
          _completer.completeError(e);
        },
        codeSent: (String verificationID, [int? forceResendingtoken]) {
          _completer.complete(verificationID);
          _verificationId = verificationID;
        },
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

    try {
      String result = await _completer.future;
      return Right(result);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-phone-number':
          return Left(VerifyPhoneNumberFailure(
              message: 'Не можливо використовувати цей номер'));
        default:
          return Left(VerifyPhoneNumberFailure(message: 'Невідома помилка'));
      }
    }
  }

  @override
  // TODO: implement user
  Stream<UserEntity> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null
          ? UserEntity.empty
          : UserEntity(
              id: firebaseUser.uid,
              email: firebaseUser.email ?? '',
              phoneNumber: firebaseUser.phoneNumber ?? '',
              displayName: firebaseUser.displayName ?? '');
      return user;
    });
  }

  @override
  // TODO: implement phoneNumber
  String get phoneNumber => _phoneNumber;

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return Right(null);
    } catch (e) {
      return Left(SignOutFailure(message: e.toString()));
    }
  }

  @override
  Either<Failure, void> updateUserInfo(
      {required String fName, required String lName, String? email}) {
    try {
      _user!.updateDisplayName('$fName $lName');
      if (email == '') {
        _user!.updateEmail('your@email.com');
      }

      return const Right(null);
    } catch (e) {
      return Left(UpdateUserFailure(message: e.toString()));
    }
  }
}
