import 'package:flutter/material.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('Name from First Screen: $name'),
            SizedBox(height: 20),
            Text('Selected User Name:'),
            ElevatedButton(
              child: Text('Choose a User'),
              onPressed: () {
                // Navigasi ke ThirdScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
