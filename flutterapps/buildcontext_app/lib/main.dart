//props

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ParentWidget()));
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _counter = 0;

  void _handleIncrement() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Props Example")),
      body: Center(
        // Passing data and a callback to the child
        child: ChildWidget(
          title: "Counter Value",  //static props
          count: _counter, // state as prop
          onPress: _handleIncrement, //function as prop or method as prop
        ),
      ),
    );
  }
}
// 2. The Child Widget (Stateless "Presentational" Component)
class ChildWidget extends StatelessWidget {
  // Think of these as React Props
  final String title;
  final int count;
  final VoidCallback onPress;

  const ChildWidget({
    super.key,
    required this.title,
    required this.count,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            "$count",
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onPress,
            icon: const Icon(Icons.add),
            label: const Text("Increment Parent State"),
          ),
        ],
      ),
    );
  }
}


