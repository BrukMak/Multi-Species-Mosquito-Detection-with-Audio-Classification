import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';
import 'package:mosdetector/features/mosqiuto/domain/usecases/get_mosquito.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/detect_mosquito.dart';
import '../../domain/usecases/get_mosquito.dart';
import '../../domain/usecases/get_mosquitoes.dart';

part 'mosqiuto_event.dart';
part 'mosqiuto_state.dart';

class MosqiutoBloc extends Bloc<MosqiutoEvent, MosqiutoState> {
  GetMosquito getMosquito;
  GetMosquitoes getMosquitoes;
  DetectMosquito detectMosquito;

  MosqiutoBloc(
      {required this.getMosquito,
      required this.getMosquitoes,
      required this.detectMosquito})
      : super(MosqiutoInitial()) {
    on<MosqiutoEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MosquitoDetectMosquitoesEvent>(((event, emit) async {
      emit(MosquitoLoadingState());
      final result = await detectMosquito(event.audio);
      result.fold((l) => emit(MosquitoFailureState(error: l.toString())),
          (r) => emit(MosquitoSuccessState(mosqiutoes: [r])));
    }));

    on<MosquitoGetMosquitoDetailEvent>(((event, emit) async => {
          emit(MosquitoLoadingState()),
          await getMosquito(event.id).then((value) => value.fold(
              (l) => emit(MosquitoFailureState(error: l.toString())),
              (r) => emit(MosquitoSuccessState(mosqiutoes: [r]))))
        }));

    on<MosquitoGetMosquitoesEvent>(((event, emit) async => {
          emit(MosquitoLoadingState()),
          await getMosquitoes(NoParams()).then((value) => value.fold(
              (l) => emit(MosquitoFailureState(error: l.toString())),
              (r) => emit(MosquitoSuccessState(mosqiutoes: r))))
        }));
  }
}