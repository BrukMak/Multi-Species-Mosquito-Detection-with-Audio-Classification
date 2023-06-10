part of 'mosqiuto_bloc.dart';

@immutable
abstract class MosqiutoState {}

class MosqiutoInitial extends MosqiutoState {}

class MosquitoLoadingState extends MosqiutoState {}

class MosquitoSuccessState extends MosqiutoState {
  List<MosquitoModel> mosqiutoes;

  MosquitoSuccessState({required this.mosqiutoes});

  @override
  List<Object> get props => [mosqiutoes];
}

class MosquitoDetectedState extends MosqiutoState {
  final MosquitoModel mosquitoModel;
  MosquitoDetectedState({required this.mosquitoModel});
}

class MosquitoFailureState extends MosqiutoState {
  final String error;

  MosquitoFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
