import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hello StateLess widget!!!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 50,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
