
import 'package:dartz/dartz.dart';
import 'package:mosdetector/core/error/failures.dart';

import '../entities/mosquito_domain.dart';

abstract class MosqiutoRepository {
  Future<Either<Failure, List<Mosquito>>> getMosquitoes();
  Future<Either<Failure, Mosquito>> getMosquito(String id);
  Future<Either<Failure, Mosquito>> detectedMosquito(String audio);
}
