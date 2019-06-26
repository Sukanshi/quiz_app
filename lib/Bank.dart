import 'package:quiz_app/Question.dart';

import 'main.dart';

var bnk = QuizPage();

class Bank {

  var questionNumber = 0;
  var out = 0;


  List<Question> questionBank = [
    Question(
        a: 'Civil Right laws protect individuals from government interference',
        b: 'Right'),
    Question(a: 'Red has higher frequency light than Blue', b: 'Wrong'),
    Question(a: 'Earth\'s atmostphere is mostly Nitrogen', b: 'Wrong'),
    Question(a: 'Some cats are actually allergic to humans', b: 'Right'),
    Question(a: 'A slug\'s blood is green', b: 'Right'),
    Question(
        a: 'Approximately one quarter of human bones are in the feet', b: 'Right'),
    Question(a: 'Earth\'s atmostphere is mostly Nitrogen', b: 'Wrong'),
    Question(a: 'Some cats are actually allergic to humans', b: 'Right'),
    Question(a: 'A slug\'s blood is green', b: 'Right'),
    Question(
        a: 'Approximately one quarter of human bones are in the feet', b: 'Right'),
  ];
  void nextquestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }
  String gettext() {
    return questionBank[questionNumber].text;
  }
  String getAnswer() {
    return questionBank[questionNumber].answer;
  }
  String output() {
    if (questionNumber >= questionBank.length - 1) {
      print('True');
      return 'Right';

    } else {
      return 'Wrong';

    }
  }

  void reset() {
    questionNumber = questionBank.length - 1;
  }




  }



