import 'package:flutter/material.dart';
import 'package:quiz_app/components/my_button.dart';
import 'package:quiz_app/pages/question.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _questions = [
    {
      "question": "What is your favourite Color",
      "answers": ["Green", "Red", "Blue", "Pink"]
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // question
            const Question(
              question: "What is your Favourite Color",
            ),
            const SizedBox(
              height: 40,
            ),
            MyButton(
              onPressed: () {},
              text: "Answer 1",
            ),
            MyButton(
              onPressed: () {},
              text: "Answer 2",
            ),
            MyButton(
              onPressed: () {},
              text: "Answer 3",
            ),
            MyButton(
              onPressed: () {},
              text: "Answer 4",
            ),
          ],
        ),
      ),
    );
  }
}
