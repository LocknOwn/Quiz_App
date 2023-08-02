import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen(
      {super.key, required this.score, required void Function() onRestartQuiz});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: FutureBuilder<void>(
            future: Future.delayed(Duration(seconds: 2)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Skor Anda: $score \n',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                        );
                      },
                      child: Text('Quiz Home'),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
