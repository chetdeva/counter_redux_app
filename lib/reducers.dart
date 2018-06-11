import 'actions.dart';
import 'states.dart';

CounterState counterReducer(CounterState previousState, dynamic action) {
  if (action is IncrementAction) {
    return CounterState(previousState.count + action.count);
  } else if (action is DecrementAction) {
    return CounterState(previousState.count - action.count);
  } else {
    return previousState;
  }
}
