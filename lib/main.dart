import 'package:bloc_architecture/logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';

import 'presentation/screens/home_page.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  MyApp({required this.connectivity});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
              internetCubit: BlocProvider.of<InternetCubit>(context)),
        )
      ],
      child: MaterialApp(
        title: 'Bloc Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Bloc Architecture Simple Demo'),
      ),
    );
  }
}
