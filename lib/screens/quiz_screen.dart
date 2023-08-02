import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<int?> _selectedAnswers = List.filled(5, null);

  final List<Map<String, Object>> _questions = [
    {
      'question': '1. Apa nama ibukota Indonesia?',
      'answers': ['Pekanbaru', 'Jakarta', 'Bandung', 'Medan'],
      'correctAnswer': 1,
    },
    {
      'question': '2. Siapakah presiden Indonesia saat ini?',
      'answers': [
        'Prabowo Subianto',
        'SBY',
        'Megawati Soekarno Putri',
        'Joko Widodo'
      ],
      'correctAnswer': 3,
    },
    {
      'question': '3. Apa warna bendera Indonesia?',
      'answers': ['Merah Putih', 'Kuning Biru', 'Hijau Putih', 'Merah Biru'],
      'correctAnswer': 0,
    },
    {
      'question': '4. Siapakah penemu bola lampu?',
      'answers': [
        'Nikola Tesla',
        'Alexander Graham Bell',
        'Thomas Alva Edison',
        'Marie Curie'
      ],
      'correctAnswer': 2,
    },
    {
      'question': '5. Apa nama ibukota Jepang?',
      'answers': ['Osaka', 'Kyoto', 'Hiroshima', 'Tokyo'],
      'correctAnswer': 3,
    },
  ];

  void _answerQuestion(int selectedAnswerIndex) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = selectedAnswerIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _goToResult();
    }
  }

  void _goToResult() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correctAnswer']) {
        score++;
      }
    }
    setState(() {
      _score = score;
      _currentQuestionIndex = _questions.length;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _selectedAnswers = List.filled(3, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentQuestionIndex < _questions.length
          ? AppBar(
              title: const Text('Questions'),
              centerTitle: true,
              automaticallyImplyLeading: false,
            )
          : null, // inisiasi agar AppBar tidak menumpuk saat menampilkan result
      body: _currentQuestionIndex < _questions.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _questions[_currentQuestionIndex]['question'] as String,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ...(_questions[_currentQuestionIndex]['answers']
                        as List<String>)
                    .asMap()
                    .entries
                    .map((entry) {
                  int index = entry.key;
                  String answer = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: index,
                          groupValue: _selectedAnswers[_currentQuestionIndex],
                          onChanged: (value) {
                            _answerQuestion(value!);
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(answer),
                      ],
                    ),
                  );
                }).toList(),
                const SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedAnswers[_currentQuestionIndex] != null) {
                          _nextQuestion();
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Peringatan!'),
                              content: const Text(
                                  'Anda belum memilih jawaban.\n'
                                  'Silahkan pilih satu jawaban sebelum melanjutkan'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OKE'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Lanjut'),
                    ),
                  ),
                ),
              ],
            )
          : ResultScreen(score: _score, onRestartQuiz: _resetQuiz),
    );
  }
}
