import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Navigation Menu",
          ),
          Expanded(child:   )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(),
          Text("Hello World"),
        ],
      ),
    );
  }
}
