

import 'package:dartz/dartz.dart';
import 'package:mosdetector/core/error/failures.dart';
import 'package:mosdetector/features/mosqiuto/data/datasources/mosquito_provider.dart';
import 'package:mosdetector/features/mosqiuto/data/models/mosquito_model.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';
import 'package:mosdetector/features/mosqiuto/domain/repositories/mosquito_repository.dart';

class MosquitoRepositoryImpl implements MosqiutoRepository {
  MosquitoRemoteDataProvider remoteDataProvider;

  MosquitoRepositoryImpl({required this.remoteDataProvider});

  @override
  Future<Either<Failure, Mosquito>> detectedMosquito(String audio) async {
    try {
      MosquitoModel mosquitoModel = await remoteDataProvider.detectedMosquito(audio);
      return Right(mosquitoModel);      
    } catch (e) {
      return Left(ServerFailure());
    }
    
  }

  @override
  Future<Either<Failure, Mosquito>> getMosquito(String id) async {
    try {
      final mosquitoModels = await remoteDataProvider.getMosquito(id);

      return Right(mosquitoModels);
      
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Mosquito>>> getMosquitoes() async {
    try {
      final mosquitoModels = await remoteDataProvider.getMosquitoes();

      return Right(mosquitoModels);
      
    } catch (e) {
      return Left(ServerFailure());
    }

  }
  
}