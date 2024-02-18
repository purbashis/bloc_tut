
import 'package:bloc_tut/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit
        counterCubit; // Declare counterCubit as non-nullable and uninitialized

    setUp(() {
      counterCubit = CounterCubit(); // Initialize counterCubit
    });

    tearDown(() {
      counterCubit.close();
    });
test('the initial state should be CounterState(counterValue:0, wasIncremented:false)', () {
  expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: true));
});
 

    blocTest(
      'the CounterCubit should emit a CounterState(counterValue:1, wasIncremented:true) when the increment function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'the CounterCubit should emit a CounterState(counterValue:-1, wasIncremented:false) when the decrement function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
