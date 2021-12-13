import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc_template/service/data_service.dart';

class UserBloc extends Bloc<GenericEvent, GenericState> {
  final _dataService = DataService();

  UserBloc() : super(LoadingState()) {
    on<GenericEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final users = await _dataService.getUsers();
          emit(LoadedState(items: users));
        } on Exception catch (e) {
          emit(FailedToLoadState(exception: e));
        }
      }
    });
  }
}
