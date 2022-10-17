import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'main.dart';
// import 'package:path/path.dart';
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];
  List<Widget> scoreKeeper = [];

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  int getLength() {
    return _questionBank.length;
  }

  bool getAnswer(questionNumber) {
    return _questionBank[_questionNumber].answer;
  }

  void next(context) {
    if (_questionNumber < getLength() - 1) {
      print(getLength());
      print(_questionNumber);
      _questionNumber++;
    } else {
      alert(context);
    }
  }

  void restart() {
    _questionNumber = 0;
    main();
  }

  void alert(context) {
    Alert(
      context: context,
      title: "Finished!",
      desc: "You have reached the end of the quiz!",
      buttons: [
        DialogButton(
          child: Text(
            "Restart quiz",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            restart();
            Navigator.pop(context, false);
            scoreKeeper.length = 0;
          },
          color: Colors.red,
        ),
      ],
    ).show();
  }

  void checkAnswer(userInput, context) {
    if (_questionNumber < getLength()) {
      if (userInput == getAnswer(_questionNumber)) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      next(context);
    } else {
      alert(context);
    }
  }
}
