import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/selection_event.dart';

class SelectionBloc extends Bloc<SelectionEvent, int> {
  SelectionBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
    on<Reset>((event, emit) => emit(0));
  }
}
