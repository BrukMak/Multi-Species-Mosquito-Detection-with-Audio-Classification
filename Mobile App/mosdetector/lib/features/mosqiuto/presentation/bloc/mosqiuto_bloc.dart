import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'mosqiuto_event.dart';
part 'mosqiuto_state.dart';

class MosqiutoBloc extends Bloc<MosqiutoEvent, MosqiutoState> {
  MosqiutoBloc() : super(MosqiutoInitial()) {
    on<MosqiutoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
