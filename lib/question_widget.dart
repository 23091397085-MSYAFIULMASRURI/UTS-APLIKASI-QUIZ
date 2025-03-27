import 'package:flutter/material.dart';

// ✅ INHERITANCE: Class dasar untuk pertanyaan
abstract class QuestionWidget extends StatelessWidget {
  final String text;

  QuestionWidget({required this.text});

  @override
  Widget build(BuildContext context);
}

// ✅ POLYMORPHISM: Menampilkan pertanyaan dalam bentuk teks
class TextQuestionWidget extends QuestionWidget {
  TextQuestionWidget({required String text}) : super(text: text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
