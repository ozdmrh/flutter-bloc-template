import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc_template/service/data_service.dart';

class UserPostsBloc extends Bloc<GenericEvent, GenericState> {
  final _dataService = DataService();

  UserPostsBloc(int userId) : super(LoadingState()) {
    on<GenericEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await _dataService.getUserPosts(userId);
          emit(LoadedState(items: posts));
        } on Exception catch (e) {
          emit(FailedToLoadState(exception: e));
        }
      }
    });
  }
}
