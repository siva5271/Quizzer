import 'package:flutter/material.dart';

import 'quiz_brain.dart';

var quizBrain = QuizBrain();

void main() => runApp(Quizzer());

class Quizzer extends StatefulWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  State<Quizzer> createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(backgroundColor: Colors.black, body: QuizPage()),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              quizBrain.getQuestion(),
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextButton(
              onPressed: () {
                setState(() {
                  quizBrain.checkAnswer(true, context);
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: (Text(
                'True',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                setState(() {
                  quizBrain.checkAnswer(false, context);
                });
              },
              child: (Text(
                'False',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
            ),
          ),
        ),
        Row(
          children: quizBrain.scoreKeeper,
        )
      ],
    );
  }
}
