import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, ParamsIn> {
  Future<Either<Failure, Type>> call(ParamsIn params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}