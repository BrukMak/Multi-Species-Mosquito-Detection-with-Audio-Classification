import 'package:dartz/dartz.dart';
import 'package:mosdetector/core/error/failures.dart';

import '../../data/models/mosquito_model.dart';
import '../entities/mosquito_domain.dart';

abstract class MosqiutoRepository {
  Future<Either<Failure, MosquitoModel>> detectedMosquito(String audio);
  Future<Either<Failure, List<MosquitoModel>>> getRecentDetections();
}
