import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Row(
            children: [
              Icon(Icons.fax_rounded),
              SizedBox(width: 8),
              Text('My App'),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Text(
            "data",
            style: TextStyle(color: Colors.red, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        drawer: Drawer(
          child: Text(
            "data",
            style: TextStyle(color: Colors.red, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        body: const Center(child: Text("Hello Material")),
      ),
    ),
  );
}
