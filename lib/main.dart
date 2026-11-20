import 'package:flutter/material.dart';

void main() => runApp(const OverflowApp());

class OverflowApp extends StatelessWidget {
  const OverflowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Overflow test')),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'A very very very very very very very very very very very very '
                  'very very very very very very very very very very very very '
                  'very very very very very very very very long title for one line',
                ),
              ),
              Icon(Icons.star),
            ],
          ),
        ),
      ),
    );
  }
}
