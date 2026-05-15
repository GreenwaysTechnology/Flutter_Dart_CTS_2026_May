import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pick an Option'),
          onPressed: () async {
            // 1. Wait for the SelectionScreen to return a value
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SelectionScreen()),
            );

            // 2. Use the result to show a SnackBar
            if (context.mounted && result != null) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('You selected: $result')));
            }
          },
        ),
      ),
    );
  }
}
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selection Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // 3. Pass the data back as the second argument of pop
              onPressed: () => Navigator.pop(context, 'Red Pill'),
              child: const Text('Red Pill'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Blue Pill'),
              child: const Text('Blue Pill'),
            ),
          ],
        ),
      ),
    );
  }
}
