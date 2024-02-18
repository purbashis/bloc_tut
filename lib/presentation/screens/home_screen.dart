import 'package:bloc_tut/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(
              height: 24,
            ),

            //BlocConsumer = BlocBuilder + BlocConsumer
            BlocConsumer<CounterCubit, CounterState>(

                //listener
                listener: (context, state) {
              if (state.wasIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Incremented!'),
                  duration: Duration(milliseconds: 300),
                ));
              } else if (state.wasIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Decremented!'),
                  duration: Duration(milliseconds: 300),
                ));
              }
            },
                //builder
                builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  'BRB , NEgATIVE' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else if (state.counterValue % 2 == 0) {
                return Text(
                  'YAAY,EVEN NUMBER' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else if (state.counterValue == 5) {
                return Text(
                  'HMM ,NUMBER ' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            }),
          Material(
              // Wrap the first Row with Material widget
              type: MaterialType.transparency,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'decrement_button',
                    child: FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              // Wrap the second Row with Material widget
              type: MaterialType.transparency,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'increment_button',
                    child: FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value( value: BlocProvider.of<CounterCubit>(context),
                        child: SecondScreen(
                            title: 'Second Screen', color: Colors.red))));
              },
              child: Text('Go to second Screen'),
            )
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
