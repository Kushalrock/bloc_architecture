part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool incremented;

  CounterState({
    required this.counterValue,
    this.incremented = false,
  });

  @override
  List<Object?> get props => [this.counterValue, this.incremented];
}
