part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool incremented;

  CounterState({
    required this.counterValue,
    this.incremented = false,
  });
}
