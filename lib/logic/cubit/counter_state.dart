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

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'incremented': incremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'],
      incremented: map['incremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
