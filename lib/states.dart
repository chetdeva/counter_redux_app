import 'package:meta/meta.dart';

@immutable
class CounterState {

  static var empty = CounterState(0);

  int count;

  CounterState(this.count);
}