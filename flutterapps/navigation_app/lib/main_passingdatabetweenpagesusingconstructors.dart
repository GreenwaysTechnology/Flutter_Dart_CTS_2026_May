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
      appBar: AppBar(title: const Text('Send Data Example')),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Detail'),
          onPressed: () {
            // 2. Create the data
            final todo = Todo(
              'Buy Milk',
              'Get the low-fat version from the corner store.',
            );

            // 3. Pass the data to the DetailScreen constructor
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(todo: todo)),
            );
          },
        ),
      ),
    );
  }
}
// 4. The DetailScreen accepts the data through its constructor
class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

