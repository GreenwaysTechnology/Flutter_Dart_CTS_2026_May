import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //1.we define "the broadcast" at the top
      theme: ThemeData(
        primaryColor: Colors.green,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      home: const StylePage(),
    );
  }
}

class StylePage extends StatelessWidget {
  const StylePage({super.key});

  @override
  Widget build(BuildContext context) {
    // we use context to find the nearest Theme data
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Example"),
        backgroundColor: theme.primaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: Text("Hello World", style: theme.textTheme.displayLarge),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
