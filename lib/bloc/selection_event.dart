abstract class SelectionEvent {}

/// Notifies bloc to increment state.
class Increment extends SelectionEvent {}

/// Notifies bloc to decrement state.
class Decrement extends SelectionEvent {}

class Reset extends SelectionEvent {}
