import 'package:flutter/material.dart';
import 'package:quizapp/brain.dart';
import 'package:quizapp/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(115, 73, 73, 73),
          title: Center(
              child: Text(
            'SJ Quizz',
            style: TextStyle(color: Colors.white),
          )),
        ),
        backgroundColor: Color.fromARGB(216, 24, 24, 24),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score = [];
  int flag = 0;
  void alert() {
    Alert(
            context: context,
            title: "Max Limit",
            desc: "Maximum number of questions reached.")
        .show();
  }

  void display(bool userchoice) {
    if (flag == 1) {
      Alert(
              context: context,
              title: "Max Limit",
              desc: "Maximum number of questions reached.")
          .show();
      score.clear();
    } else {
      if (br.getAns() == userchoice) {
        print('Correct Answer');
        score.add(Icon(Icons.check, color: Colors.green));
      } else {
        print('Wrong Answer');
        score.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      setState(() {
        flag = br.check();
      });
    }
  }

  Brain br = Brain();

  // List<String> ques=['You can lead a cow down stairs but not up stairs.',
  // 'Approximately one quarter of human bones are in the feet.',
  // 'A slug\'s blood is green.', ];
  // List<bool> ans=[false,true,true];
  // Question q1=Question(q: 'You can lead a cow down stairs but not up stairs.', a:false);
  // List<Question> Quesset=[
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true)
  // ];

  //int inc = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                br.getQues(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              //textColor: Colors.white,
              //color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                display(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              //color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                display(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}

// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,  shoe,chocolate,rainy days,dress,spice,neckless,water
