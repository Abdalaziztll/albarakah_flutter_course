import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_uitity/component/flushbar.dart';
import 'package:intro_to_uitity/model/question.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizApp());
  }
}

List<QuestionModel> question = [
  QuestionModel(question: 'How long are you ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '1.89', isCorrect: true),
  ]),
  QuestionModel(question: 'How long are you ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '1.89', isCorrect: true),
  ]),
  QuestionModel(question: 'How long are you ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '1.89', isCorrect: true),
  ]),
  QuestionModel(question: 'How long are you ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '1.89', isCorrect: true),
  ]),
];

int score = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   new SnackBar(
              //     duration: Duration(seconds: 10),
              //     backgroundColor: Colors.green,
              //     behavior: SnackBarBehavior.floating,
              //     elevation: 0,
              //     showCloseIcon: true,
              //     dismissDirection: DismissDirection.startToEnd,
              //     content: Text(
              //       'Message',
              //     ),
              //     action: SnackBarAction(
              //         label: 'undo',
              //         onPressed: () {
              //        //   Navigator.pop(context);
              //         },
              //         textColor: Colors.white),
              //   ),
              // );

              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.grey.shade200),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: 'Username'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            child: FlutterLogo()),
      ),
    );
  }
}

PageController controller = PageController();

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

num answerTime = 0;

class _QuizAppState extends State<QuizApp> with UitilityComponent {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: question.length,
        itemBuilder: (context, index) => Scaffold(
          appBar: AppBar(
            actions: [Text(answerTime.toString())],
            centerTitle: true,
            title: Text(score.toString()),
          ),
          body: Column(
            children: [
              // CircularProgressIndicator(
              //   value: 0.7,
              // ),
              ListTile(
                title: Text(question[index].question),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: question[index].answers.length,
                  itemBuilder: (context, ind) => InkWell(
                    onTap: () {
                      // checkoutAnswer(question[index].answers[ind].isCorrect,
                      //     context, question[index].time, answerTime);
                      // answerTime = 0;
                      showMyFlushBar(context);
                      checkoutAnswer(question[index].answers[ind].isCorrect,
                          context, question[index].time, answerTime);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((ind + 1).toString()),
                      ),
                      title: Text(question[index].answers[ind].answer),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
