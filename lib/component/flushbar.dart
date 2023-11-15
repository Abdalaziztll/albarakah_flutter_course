import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_uitity/main.dart';

mixin UitilityComponent {
  showMyFlushBar(BuildContext context) {
    Flushbar(
      title: "Hey Ninja",
      titleColor: Colors.white,
      message:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.check,
        color: Colors.greenAccent,
      ),
      mainButton: ElevatedButton(
        onPressed: () {},
        child: Text(
          "CLAP",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Hello Hero",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.yellow[600],
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        "You killed that giant monster in the city. Congratulations!",
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.green,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    )..show(context);
  }

  checkoutAnswer(
      bool isCorrect, BuildContext context, num time, num answerTime) {
    if (time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Time Out'),
        backgroundColor: Colors.blue,
      ));
      controller.nextPage(duration: Duration(seconds: 2), curve: Curves.easeIn);
    } else {
      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Success'),
          backgroundColor: Colors.green,
        ));
        controller.nextPage(
            duration: Duration(seconds: 2), curve: Curves.easeIn);
        score++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Failed'),
          backgroundColor: Colors.red,
        ));

        controller.nextPage(
            duration: Duration(seconds: 2), curve: Curves.easeIn);
        score--;
      }
    }
  }
}
