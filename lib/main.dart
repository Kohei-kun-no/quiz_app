import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Do you wake up at the same time every day?',
      'answers': [
        {'text': 'Yes, every day', 'score': 10},
        {'text': 'Yes, almost every day', 'score': 7},
        {'text': 'Yes, but sometimes I cannot', 'score': 4},
        {'text': 'No, I wake up randomly', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your feeling when you waked up today?',
      'answers': [
        {'text': 'Great', 'score': 10},
        {'text': 'Not But', 'score': 7},
        {'text': 'Normal', 'score': 4},
        {'text': 'Angry', 'score': 1},
      ],
    },
    {
      'questionText': 'Do you feel sleepy at day time?',
      'answers': [
        {'text': 'No', 'score': 10},
        {'text': 'Sometimes', 'score': 7},
        {'text': 'Often', 'score': 4},
        {'text': 'Always', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sleep score'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
