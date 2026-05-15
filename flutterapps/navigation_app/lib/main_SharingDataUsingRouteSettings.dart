import 'package:flutter/material.dart';

// 1. Define a simple data model
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
void main() => runApp(const MaterialApp(home: HomeScreen()));
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Data Example!!!')),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Detail'),
          onPressed: () {
            final todo = Todo(
              'Buy Milk',
              'Get the low-fat version from the corner store.',
            );

            // 2. Pass the data via the 'arguments' property
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
                settings: RouteSettings(arguments: todo), // <--- Added this
              ),
            );
          },
        ),
      ),
    );
  }
}

// 3. DetailScreen no longer takes 'todo' in the constructor
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 4. Extract the Todo object using ModalRoute.of
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

