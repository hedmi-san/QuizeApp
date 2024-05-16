import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/model.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key, required this.quiz});
  final QuizSet quiz;

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  int currentQuizQuestionIndex = 0;
  List<int?> selectedAnswers = [];
  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quiz.questions.length, null);
  }

  void goTonextQuestion() {
    if (currentQuizQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentQuizQuestionIndex++;
      });
    }
  }

  void goToPreviousQuestion() {
    if (currentQuizQuestionIndex > 0) {
      setState(() {
        currentQuizQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion =
        widget.quiz.questions[currentQuizQuestionIndex];
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.indigo,
            Colors.purple,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_sharp),
                  ),
                  Text(
                    widget.quiz.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(currentQuestion.question)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//32:15