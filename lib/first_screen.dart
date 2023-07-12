import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();
  bool isPalindrome = false;

  void checkPalindrome() {
    String sentence = sentenceController.text.toLowerCase().replaceAll(' ', '');
    String reversedSentence = sentence.split('').reversed.join('');
    if (sentence == reversedSentence) {
      setState(() {
        isPalindrome = true;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Palindrome Check'),
            content: const Text('isPalindrome'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        isPalindrome = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Palindrome Check'),
            content: const Text('not palindrome'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: sentenceController,
              decoration: const InputDecoration(
                labelText: 'Sentence',
              ),
            ),
            ElevatedButton(
              child: const Text('Check'),
              onPressed: checkPalindrome,
            ),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                // Navigasi ke SecondScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      name: nameController.text,
                    ),
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
