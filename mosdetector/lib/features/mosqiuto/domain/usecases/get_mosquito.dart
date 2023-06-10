import 'package:dartz/dartz.dart';
import 'package:mosdetector/features/mosqiuto/data/models/mosquito_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/mosquito_domain.dart';
import '../repositories/mosquito_repository.dart';

class GetMosquito implements UseCase<List<MosquitoModel>, String> {
  final MosqiutoRepository repository;

  GetMosquito(this.repository);

  @override
  Future<Either<Failure, List<MosquitoModel>>> call(String name) async {
    return await repository.getRecentDetections(name);
  }
}

class Params {
  final int id;
  Params({required this.id});
}
