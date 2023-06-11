import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mosdetector/features/mosqiuto/domain/entities/mosquito_domain.dart';
import 'package:mosdetector/features/mosqiuto/domain/usecases/get_mosquito.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/mosquito_model.dart';
import '../../domain/usecases/detect_mosquito.dart';
import '../../domain/usecases/get_mosquito.dart';

part 'mosqiuto_event.dart';
part 'mosqiuto_state.dart';

class MosqiutoBloc extends Bloc<MosqiutoEvent, MosqiutoState> {
  GetMosquito getMosquito;
  DetectMosquito detectMosquito;

  MosqiutoBloc(
      {required this.getMosquito,
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

  

    on<MosquitoGetMosquitoesEvent>(((event, emit) async => {
          emit(MosquitoLoadingState()),
          await getMosquito(NoParams()).then((value) => value.fold(
              (l) => emit(MosquitoFailureState(error: l.toString())),
              (r) => emit(MosquitoSuccessState(mosqiutoes: r))))
        }));
  }
}
