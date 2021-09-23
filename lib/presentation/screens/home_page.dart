import 'package:bloc_architecture/constants/enums.dart';
import 'package:bloc_architecture/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile Conected');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text('Wifi Conected');
                } else if (state is InternetDisconnected) {
                  return Text('Disconnected');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.incremented) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 20),
                    ),
                  );
                }
                if (!state.incremented) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 20),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
