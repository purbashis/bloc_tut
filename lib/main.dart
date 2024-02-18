import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  // final CounterState counterState1 = CounterState(counterValue: 1);
  // final CounterState counterState2 = CounterState(counterValue: 1);
  // print(counterState1 == counterState2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(title: 'Flutter Bloc',color: Colors.lightBlueAccent,),
      ),
    );
  }
}
