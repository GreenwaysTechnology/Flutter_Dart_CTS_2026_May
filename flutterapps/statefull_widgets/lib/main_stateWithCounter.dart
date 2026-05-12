import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  //data -state
  int counter = 10;

  //listener function: biz logic
  void incrementCounter() {
    //invoke setState function
    setState(() {
      counter++;
    });
  }

  //three things : state , listener(biz logic), build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Widget Demo')),
      body: Center(
        child: Text('Counter: $counter', style: const TextStyle(fontSize: 28)),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   incrementCounter();
        // },
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

//state less Widget which displays statefull widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
