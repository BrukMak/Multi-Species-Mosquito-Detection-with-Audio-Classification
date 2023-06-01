

import 'package:dartz/dartz.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/mosquito_repository.dart';

class DetectMosquito implements UseCase<Mosquito, String> {
  MosqiutoRepository repository;
  
  DetectMosquito({required this.repository});

  @override
  Future<Either<Failure, Mosquito>> call(String audio) {
    throw repository.detectedMosquito(audio);
  }
  
}