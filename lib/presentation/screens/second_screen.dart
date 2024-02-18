 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {},
              child: Text('Go to second Screen'),
            )
          ],
        ),
      ),
    );
    
  }
}
