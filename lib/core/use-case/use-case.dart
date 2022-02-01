import 'package:dartz/dartz.dart';
import 'package:freshcode_loyalty_t3/core/errors/failure.dart';

abstract class UseCase<TParams, TReturnValue> {
  Future<Either<Failure, TReturnValue>> execute(TParams params);
}