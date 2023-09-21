import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      counter++;
      numbers.add(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Counter',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (var i in numbers) Text('$i'),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
