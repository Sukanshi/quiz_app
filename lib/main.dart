import 'package:flutter/material.dart';
import 'package:quiz_app/Bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Bank bank = Bank();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    color: Colors.white,
    home: QuizPage(),
  ),
  );
}

class QuizPage extends StatefulWidget {


  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> setChecker = [];

  void result(String userAnswer){
    String answer = bank.getAnswer();
    setState(() {

      var score = (bank.out/bank.questionBank.length)*100;

      if(bank.output() == 'Right'){
        Alert(
            context: context,
            title: "Finished",
             desc: "You're result is: $score",
            buttons: [
              DialogButton(
                  child: Text('Exit'),
                  onPressed: () => Navigator.pop(context)),
              DialogButton(
                  child: Text('Start Again'),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
            ]
               ).show();
        bank.reset();
        setChecker = [];
      }
      else{
      if (userAnswer == answer){
      setChecker.add(Icon(
        Icons.check,
      color: Colors.green));
      print('true');
      bank.out++;

    }
    else {
        setChecker.add(Icon(
          Icons.clear,
        color: Colors.red,),);
        print('false');
    }
    bank.nextquestion();
    }
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text('Question ${bank.questionNumber} of ${bank.questionBank.length}',textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black),),
        ),
      ),
       body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
              Expanded(
                 flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      bank.gettext(),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,),
                  ),
                ),
              ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.all(10.0),
                   child: RaisedButton(
                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.amber, width: 2),
                       borderRadius: BorderRadius.all(Radius.circular(100)),
                     ),
                     textColor: Colors.black,
                     color: Colors.amber,
                     child: Text('True',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 15.0,
                     ),),
                     onPressed: (){

                        result('Right');
                     },
                     //when the answer is True
                   ),
                 ),
               ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.all(10.0),
                   child: RaisedButton(
                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.amber, width: 2),
                       borderRadius: BorderRadius.all(Radius.circular(100)),
                     ),
                     textColor: Colors.black,
                     color: Colors.amber,
                     child: Text('False',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 15.0,
                       ),
                     ),
                     onPressed: (){
                       result('Wrong');
                       //when the answer is False
                     },
                   ),
                 ),
               ),
               Row(
                children: setChecker,
               ),
          ],
        ),
      ),
       ),
    );
  }
}



