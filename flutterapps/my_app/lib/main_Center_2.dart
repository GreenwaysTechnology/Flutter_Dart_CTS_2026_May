import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        "Hello Flutter!!!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 50,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
