import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.lightBlue,
          leading: Icon(Icons.menu),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom:
            Radius.circular(20)),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search is clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print("more is clicked");
              },
            ),
          ],
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
