import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/constants/enums.dart';
import 'package:bloc_architecture/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      }
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, incremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, incremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
