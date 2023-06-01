

import 'package:dartz/dartz.dart';

import 'package:mosdetector/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/mosquito_domain.dart';
import '../repositories/mosquito_repository.dart';

class GetMosquitoes extends UseCase<List<Mosquito>, NoParams> {
  MosqiutoRepository repository;
  
  GetMosquitoes({required this.repository});

  @override
  Future<Either<Failure, List<Mosquito>>> call(NoParams params) {
    throw repository.getMosquitoes();
  }
  
}