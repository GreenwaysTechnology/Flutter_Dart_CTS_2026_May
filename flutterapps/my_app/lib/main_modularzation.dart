import 'package:flutter/material.dart';
import 'package:my_app/HelloWorld.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelloWorld();
  }
}

void main() {
  runApp(MyApp());
}
