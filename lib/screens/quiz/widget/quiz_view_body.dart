import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/model.dart';
import '../../result/result_view.dart';

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
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...currentQuestion.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswers[currentQuizQuestionIndex] = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color:
                              selectedAnswers[currentQuizQuestionIndex] == index
                                  ? Colors.indigo
                                  : Colors.white,
                          border: Border.all(
                            width: 2,
                            color: selectedAnswers[currentQuizQuestionIndex] ==
                                    index
                                ? Colors.indigo
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                            child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedAnswers[currentQuizQuestionIndex] ==
                                    index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )),
                      ),
                    );
                  })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentQuizQuestionIndex > 0
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: goToPreviousQuestion,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      if (currentQuizQuestionIndex <
                          widget.quiz.questions.length - 1) {
                        goTonextQuestion();
                      } else {
                        int Tcorrect = 0;
                        for (int i = 0; i < widget.quiz.questions.length; i++) {
                          if (selectedAnswers[i] ==
                              widget.quiz.questions[i].selectedIndex) {
                            Tcorrect++;
                          }
                        }
                        Get.off(() => ResultScreen(
                              totalCorrect: Tcorrect,
                              totalQuestion: widget.quiz.questions.length,
                              totalAttempts: widget.quiz.questions.length,
                              quiz: widget.quiz,
                            ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        currentQuizQuestionIndex ==
                                widget.quiz.questions.length - 1
                            ? 'Submit'
                            : 'Next',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//32:15