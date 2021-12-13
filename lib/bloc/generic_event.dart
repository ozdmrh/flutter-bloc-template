abstract class GenericEvent {}

class LoadEvent extends GenericEvent {}

class PullToRefreshEvent extends GenericEvent {}

abstract class GenericState {}

class LoadingState extends GenericState {}

class LoadedState<T> extends GenericState {
  List<T>? items;
  LoadedState({this.items});
}

class FailedToLoadState extends GenericState {
  Exception exception;
  FailedToLoadState({required this.exception});
}
