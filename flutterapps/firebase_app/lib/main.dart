import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart'; // Must import this
import 'firebase_options.dart'; // This file was created by flutterfire configure

// 1. DATA MODEL - Keeps your data structured
class UserProfile {
  final String name;
  final int age;
  final String email;

  UserProfile({required this.name, required this.age, required this.email});

  // Convert object to a Map to send to Firebase
  Map<String, dynamic> toMap() {
    return {
      'full_name': name,
      'age': age,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(), // Better than local time
    };
  }
}

void main() async {
  // 1. Ensure Flutter framework is ready for platform-level calls
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase using the settings for your specific OS (Windows/Android/iOS)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 3. Now it is safe to run the app
  runApp(const MaterialApp(home: FirestoreExample()));
}

class FirestoreExample extends StatelessWidget {
  const FirestoreExample({super.key});

  // 2. DATABASE LOGIC
  Future<void> addUserToFirebase() async {
    // Reference to the collection 'users'
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      // Create a dummy user object
      UserProfile newUser = UserProfile(
        name: "Subramanian Murugan",
        age: 46,
        email: "subu@gmail.com",
      );

      // Save to Firestore
      // .add() creates an Auto-Generated ID for the document
      await users.add(newUser.toMap());
      print("User Added Successfully!");
    } catch (e) {
      print("Failed to add user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Store Data")),
      body: Center(
        child: ElevatedButton(
          onPressed: addUserToFirebase,
          child: const Text("Save User to Firestore"),
        ),
      ),
    );
  }
}

