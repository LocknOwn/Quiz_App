import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';

void main() {
  runApp(const FlutterQuizApp());
}

class FlutterQuizApp extends StatelessWidget {
  const FlutterQuizApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
