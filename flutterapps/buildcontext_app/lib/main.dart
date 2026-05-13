import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Wrap the app in ChangeNotifierProvider to make the state available everywhere
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

// 1. THE MODEL
// This holds the logic and the data.
class CounterModel extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
    // This tells the widgets listening to this model to rebuild
    notifyListeners();
  }
}

// 2. THE APP ROOT
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

// 3. THE UI
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider with listen: true to rebuild when value changes
    final counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Count:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${counter.value}',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Access the provider with listen: false because we are
          // inside a callback and only need to trigger a method.
          Provider.of<CounterModel>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}