import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_uitity/componenet/flushbar.dart';
import 'package:intro_to_uitity/model/quiz_model.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translation', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

List<QuestionModel> questions = [
  QuestionModel(question: 'What is My Name ?', availableTime: 20, answers: [
    AnswerModel(answer: 'Ahmad', isCorrect: false),
    AnswerModel(answer: 'Tareq', isCorrect: false),
    AnswerModel(answer: 'Noor', isCorrect: false),
    AnswerModel(answer: 'Abd', isCorrect: true),
  ]),
  QuestionModel(question: 'What is My Name ?', availableTime: 20, answers: [
    AnswerModel(answer: 'Ahmad', isCorrect: false),
    AnswerModel(answer: 'Tareq', isCorrect: false),
    AnswerModel(answer: 'Noor', isCorrect: false),
    AnswerModel(answer: 'Noor', isCorrect: false),
    AnswerModel(answer: 'Abd', isCorrect: true),
  ]),
  QuestionModel(question: 'What is My Name ?', availableTime: 20, answers: [
    AnswerModel(answer: 'Ahmad', isCorrect: false),
    AnswerModel(answer: 'Tareq', isCorrect: false),
    AnswerModel(answer: 'Noor', isCorrect: false),
    AnswerModel(answer: 'Abd', isCorrect: true),
  ])
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: QuizApp(),
    );
  }
}

bool value = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World').tr(),
        actions: [
          Text(value ? 'en' : 'ar'),
          Switch(
              value: value,
              onChanged: (val) {
                if (val) {
                  context.setLocale(Locale('en'));
                  setState(() {
                    value = val;
                  });
                } else {
                  setState(() {
                    value = val;
                  });
                  context.setLocale(Locale('ar'));
                }
              })
        ],
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              // showMyNewSnackBar(context);
            },
            child: Text('This is an Example').tr()),
      ),
    );
  }
}

PageController controller = PageController();
int score = 0;
num timer = 0;

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        timer++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: questions.length,
        itemBuilder: (context, index) => Scaffold(
          appBar: AppBar(
            actions: [Text(score.toString())],
            centerTitle: true,
            title: Text((index + 1).toString()),
          ),
          body: Column(
            children: [
              ListTile(
                title: Text(questions[index].question),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: questions[index].answers.length,
                  itemBuilder: (context, ind) => InkWell(
                    onTap: () {
                      checkAnswer(
                          isCorrect: questions[index].answers[ind].isCorrect,
                          context: context,
                          answerTime: timer,
                          availableTime: questions[index].availableTime);
                      timer = 0;
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((ind + 1).toString()),
                      ),
                      title: Text(questions[index].answers[ind].answer),
                    ),
                  ),
                ),
              ),
              CircularProgressIndicator(value: timer * 0.05)
            ],
          ),
        ),
      ),
    );
  }
}

checkAnswer(
    {required bool isCorrect,
    required BuildContext context,
    required num availableTime,
    required num answerTime}) {
  if (availableTime > answerTime) {
    if (isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text('Success'),
        backgroundColor: Colors.green,
      ));
      controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      score++;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text('Failed'),
        backgroundColor: Colors.red,
      ));
      controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      score--;
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text('Time out'),
      backgroundColor: Colors.blue,
    ));
  }
}
