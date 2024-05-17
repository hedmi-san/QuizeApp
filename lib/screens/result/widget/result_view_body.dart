import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizeapp/screens/home/home_view.dart';

import '../../../models/model.dart';

class ResultScreenBody extends StatelessWidget {
  const ResultScreenBody(
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
    String feedback = totalCorrect < 3
        ? 'You Failed'
        : totalCorrect < 6
            ? 'Good!'
            : totalCorrect < 8
                ? 'Great'
                : 'Awesome';
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
                    Get.off(() => const HomeScreen());
                  },
                  child: const Icon(Icons.arrow_back_sharp),
                ),
                const Text(
                  'Quiz Results',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    feedback,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'You have Scored',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${totalCorrect * 10} /${totalQuestion * 10}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
