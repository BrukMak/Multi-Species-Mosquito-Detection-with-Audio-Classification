import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mosdetector/core/error/failures.dart';
import 'package:mosdetector/features/mosqiuto/data/datasources/mosquito_provider.dart';
import 'package:mosdetector/features/mosqiuto/data/models/mosquito_model.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';
import 'package:mosdetector/features/mosqiuto/domain/repositories/mosquito_repository.dart';

import '../datasources/local_source.dart';

class MosquitoRepositoryImpl implements MosqiutoRepository {
  MosquitoRemoteDataProvider remoteDataProvider;

  MosquitoRepositoryImpl({required this.remoteDataProvider});

  @override
  Future<Either<Failure, MosquitoModel>> detectedMosquito(String audio) async {
    try {
      MosquitoModel mosquitoModel =
          await remoteDataProvider.detectedMosquito(audio);
      return Right(mosquitoModel);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MosquitoModel>>> getRecentDetections() async {

    try {
      List<MosquitoModel> mosquitoModel =
          await ShardPrefHelper.getMosquitos();
      return Right(mosquitoModel);

    } catch (e) {
      return Left(CacheFailure());
    }

  }
  
}
