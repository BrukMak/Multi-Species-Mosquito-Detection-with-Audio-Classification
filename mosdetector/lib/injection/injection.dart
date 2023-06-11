import '../features/mosqiuto/data/datasources/mosquito_provider.dart';
import '../features/mosqiuto/data/repositories/mosquito_repository_impl.dart';
import '../features/mosqiuto/domain/repositories/mosquito_repository.dart';
import '../features/mosqiuto/domain/usecases/detect_mosquito.dart';
import '../features/mosqiuto/domain/usecases/get_mosquito.dart';
import '../features/mosqiuto/presentation/bloc/mosqiuto_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  // Bloc
  sl.registerFactory(() => MosqiutoBloc(
      getMosquito: sl(),
      detectMosquito: sl()));

  // Use cases
  sl.registerFactory(() => GetMosquito(sl()));
  sl.registerFactory(() => DetectMosquito(repository: sl()));

  // Repository
  sl.registerLazySingleton<MosqiutoRepository>(
      () => MosquitoRepositoryImpl(remoteDataProvider: sl()));

  // Data sources
  sl.registerLazySingleton<MosquitoRemoteDataProvider>(
      () => MosquitoRemoteDataProviderImpl(client: sl()));


  // External
  sl.registerLazySingleton(() => http.Client());
}