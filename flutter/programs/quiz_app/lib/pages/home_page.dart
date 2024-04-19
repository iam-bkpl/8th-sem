import 'package:flutter/material.dart';
import 'package:quiz_app/components/my_button.dart';
import 'package:quiz_app/pages/question.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  // final Map<String, String> _selectedAnswers = [];

  static const _questions = [
    {
      "question": "What is your favourite Color",
      "answers": ["Green", "Red", "Blue", "Pink"]
    },
    {
      "question": "What is your favourite Food",
      "answers": ["Dal", "Bhat", "Tarkari", "Chatni"]
    },
    {
      "question": "What is your favourite Country",
      "answers": ["Nepal", "India", "China", "Japan"]
    },
    {
      "question": "What is your favourite Subject",
      "answers": ["Fltter", "Python", "Java", "JS"]
    },
  ];

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
            Question(
              question: _questions[currentIndex]["question"].toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            ...(_questions[currentIndex]['answers'] as List<String>)
                .map((answer) {
              return MyButton(
                  text: answer.toString(),
                  onPressed: () {
                    setState(() {
                      currentIndex += 1;
                    });
                  });
            }).toList(),
          ],
        ),
      ),
    );
  }
}
