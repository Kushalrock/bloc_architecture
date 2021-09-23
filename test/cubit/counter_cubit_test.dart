import 'package:bloc_architecture/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit?.close();
    });

    test('The initial state for countercubit if Countervalue 0', () {
      expect(counterCubit?.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'The cubit emits a contervalue of 1 and incremented to true when increment function is called',
      build: () {
        if (counterCubit != null) {
          return counterCubit as CounterCubit;
        }
        throw Error();
      },
      act: (bloc) => bloc.increment(),
      expect: () =>
          <CounterState>[CounterState(counterValue: 1, incremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'The cubit emits a contervalue of -1 and incremented to false when decrement function is called',
      build: () {
        if (counterCubit != null) {
          return counterCubit as CounterCubit;
        }
        throw Error();
      },
      act: (bloc) => bloc.decrement(),
      expect: () =>
          <CounterState>[CounterState(counterValue: -1, incremented: false)],
    );
  });
}
