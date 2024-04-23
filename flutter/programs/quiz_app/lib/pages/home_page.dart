import 'package:flutter/material.dart';
import 'package:quiz_app/components/my_button.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/pages/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int score = 0;
  // final Map<String, String> _selectedAnswers = [];

  final List<Map<String, dynamic>> _questions = QuestionData.getQuestions();

  void handleQuestionChange(BuildContext context, correct) {
    if (currentIndex < _questions.length - 1) {
      setState(() {
        currentIndex += 1;
      });
      if (correct) {
        score++;
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("You Scored $score / ${_questions.length}"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Quiz app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question no $currentIndex / ${_questions.length}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Question(
              question: _questions[currentIndex]["question"].toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            // ...(_questions[currentIndex]['answers'] as List <
            //         Map<String, Object>)
            //     .map((answer) {
            //   return MyButton(
            //     text: answer.toString(),
            //     onPressed: () => handleQuestionChange(context),
            //   );
            // }).toList(),

            ...(_questions[currentIndex]['answers']
                        as List<Map<String, Object>>?)
                    ?.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: MyButton(
                      text: answer['text']
                          .toString(), // Accessing the 'text' field of the answer map
                      onPressed: () =>
                          handleQuestionChange(context, answer["correct"]),
                    ),
                  );
                }).toList() ??
                [],

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                  text: "Reset",
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                MyButton(
                  text: "Save",
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
