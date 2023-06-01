

import 'package:dartz/dartz.dart';
import 'package:mosdetector/core/error/failures.dart';
import 'package:mosdetector/features/mosqiuto/data/datasources/mosquito_provider.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';
import 'package:mosdetector/features/mosqiuto/domain/repositories/mosquito_repository.dart';

class MosquitoRepositoryImpl implements MosqiutoRepository {
  MosquitoRemoteDataProvider remoteDataProvider;

  MosquitoRepositoryImpl({required this.remoteDataProvider});

  @override
  Future<Mosquito> detectedMosquito(String audio) {
    try {
      
    } catch (e) {
      
    }
    
  }

  @override
  Future<Either<Failure, Mosquito>> getMosquito(String id) {
    // TODO: implement getMosquito
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Mosquito>>> getMosquitoes() {
    // TODO: implement getMosquitoes
    throw UnimplementedError();
  }
  
}