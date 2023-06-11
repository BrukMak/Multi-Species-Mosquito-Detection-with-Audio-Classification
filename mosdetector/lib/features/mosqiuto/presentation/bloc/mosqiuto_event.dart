part of 'mosqiuto_bloc.dart';

@immutable
abstract class MosqiutoEvent {}

class MosquitoGetMosquitoDetailEvent extends MosqiutoEvent {
  String id;
  MosquitoGetMosquitoDetailEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class MosquitoGetMosquitoesEvent extends MosqiutoEvent {
  MosquitoGetMosquitoesEvent();
  @override
  List<Object> get props => [];
}

class MosquitoDetectMosquitoesEvent extends MosqiutoEvent {
  final String audio;
  MosquitoDetectMosquitoesEvent({required this.audio});

  @override
  List<Object> get props => [audio];
}
