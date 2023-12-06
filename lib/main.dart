import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> color;
  late bool isFavorite;
  late Animation<double?> size;
  late Animation<double> sequence ;

  @override
  void initState() {
    isFavorite = false;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    size = Tween(begin: 20.0, end: 50.0).animate(controller);
    sequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 20.0, end: 50.0), weight: 5),
    TweenSequenceItem(tween: Tween(begin: 50.0, end: 20.0), weight: 1),
    TweenSequenceItem(tween: Tween(begin: 20.0, end: 30.0), weight: 5),
    TweenSequenceItem(tween: Tween(begin: 30.0, end: 20.0), weight: 1)
  ]).animate(controller);
    // controller.addListener(() {
    //   print(controller.value);
    //   print(color.value);
    // });

    controller.addStatusListener((status) {
      print(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, _) {
          return ListTile(
            title: Text('Iphone 16'),
            trailing: IconButton(
              iconSize: sequence.value,
              onPressed: () {
                if (!isFavorite) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                isFavorite = !isFavorite;
              },
              icon: Icon(
                Icons.favorite,
                color: color.value,
              ),
            ),
          );
        },
        animation: controller,
      ),
    );
  }
}


// ? Curve