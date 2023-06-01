


import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/mosquito_domain.dart';
import '../repositories/mosquito_repository.dart';

class GetMosquito extends UseCase<Mosquito, String> {
  final MosqiutoRepository repository;

  GetMosquito(this.repository);

  @override
  Future<Either<Failure, Mosquito>> call(String id) async {
    return await repository.getMosquito(id);
  }
}

class Params {
  final int id;
  Params({required this.id});
}


  
