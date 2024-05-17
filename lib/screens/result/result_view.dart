import 'package:flutter/material.dart';
import 'package:quizeapp/models/model.dart';

import 'widget/result_view_body.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.totalQuestion,
      required this.totalAttempts,
      required this.totalCorrect,
      required this.quiz});
  final int totalQuestion;
  final int totalAttempts;
  final int totalCorrect;
  final QuizSet quiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResultScreenBody(
          totalAttempts: totalAttempts,
          totalCorrect: totalCorrect,
          totalQuestion: totalQuestion,
          quiz: quiz),
    );
  }
}
