import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import SplashScreen
import 'quiz_model.dart'; // Import QuizModel
import 'question_widget.dart'; // Import widget

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(), // SplashScreen sebagai halaman pertama
));

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz Mahasiswa Vokasi"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Class QuizPage menggunakan StatefulWidget
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

// ✅ Class State untuk QuizPage
class _QuizPageState extends State<QuizPage> {
  int _score = 0;
  int _currentQuestionIndex = 0;
  final List<QuizModel> questions = quizQuestions; // Gunakan model QuizModel

  // ✅ POLYMORPHISM: Fungsi untuk memilih widget pertanyaan
  Widget _getQuestionWidget(QuizModel question) {
    return TextQuestionWidget(text: question.question);
  }

  // ✅ Fungsi untuk memeriksa jawaban pengguna
  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[_currentQuestionIndex].answerIndex) {
      _score++; // Jika benar, tambah skor
    }
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  // ✅ Fungsi untuk menampilkan dialog hasil kuis
  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hasil Quiz'),
        content: Text('Skor Anda: $_score/${questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _score = 0;
                _currentQuestionIndex = 0;
              });
              Navigator.of(ctx).pop();
            },
            child: Text('Ulangi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // ✅ Tampilkan pertanyaan dengan Polymorphism
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: _getQuestionWidget(questions[_currentQuestionIndex]),
          ),
        ),
        SizedBox(height: 30),
        // ✅ Tampilkan opsi jawaban
        ...List.generate(questions[_currentQuestionIndex].options.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => _checkAnswer(index),
              child: Text(
                questions[_currentQuestionIndex].options[index],
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        }),
      ],
    );
  }
}
