import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hai, Selamat datang di Quiz!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tes pengetahuan Anda melalui beberapa pertanyaan. \n'
              'Ada 5 pertanyaan, dan 4 pilihan jawaban untuk tiap pertanyaan. \n\n'
              'Selamat mencoba! \n\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                Future.delayed(Duration(milliseconds: 800), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                });
              },
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
