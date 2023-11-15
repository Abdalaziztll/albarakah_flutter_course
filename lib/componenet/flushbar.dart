import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showMyNewSnackBar(BuildContext context) {
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
    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: false,
    duration: Duration(seconds: 3),
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
