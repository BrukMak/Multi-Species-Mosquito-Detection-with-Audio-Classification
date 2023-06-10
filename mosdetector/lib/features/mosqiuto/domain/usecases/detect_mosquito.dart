

import 'package:dartz/dartz.dart';
import 'package:mosdetector/features/mosqiuto/data/models/mosquito_model.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/mosquito_repository.dart';

class DetectMosquito implements UseCase<MosquitoModel, String> {
  MosqiutoRepository repository;
  
  DetectMosquito({required this.repository});

  @override
  Future<Either<Failure, MosquitoModel>> call(String audio) {
    return repository.detectedMosquito(audio);
  }
  
}