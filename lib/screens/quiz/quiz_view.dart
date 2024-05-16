import 'package:flutter/material.dart';
import 'package:quizeapp/models/model.dart';

import 'widget/quiz_view_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.quiz});
  final QuizSet quiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizViewBody(quiz: quiz),
    );
  }
}
