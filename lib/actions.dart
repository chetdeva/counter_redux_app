
enum Action {
  Increment, Decrement
}

class IncrementAction { // sealed
  int count;

  IncrementAction(this.count);
}

class DecrementAction {
  int count;

  DecrementAction(this.count);
}
