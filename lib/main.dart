import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contes) {
    return MaterialApp(
      home: CustomizePage(),
    );
  }
}

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Hero(
                  tag: 'anime',
                  child: Center(child: Text('Hello world')),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('prevouis page')),
            Hero(
                tag: 'logo',
                child: FlutterLogo(
                  size: 200,
                ))
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool logic = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
        leading: Hero(
          tag: 'logo',
          child: FlutterLogo(),
        ),
        trailing: Checkbox(
          onChanged: (value) {
            setState(() {
              logic = value!;
            });
            print(logic);
          },
          value: logic,
        ),
      ),
    );
  }
}

class CustomizePage extends StatefulWidget {
  const CustomizePage({super.key});

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  bool magic = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print('object');
                setState(() {
                  width = width + 30;
                  height = height + 30;
                  color = Colors.blue;
                });
              },
              child: Visibility(
                replacement: FlutterLogo(
                  size: 300,
                  duration: Duration(seconds: 4),
                ),
                visible: magic,
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  duration: Duration(seconds: 1),
                  width: width,
                  height: height,
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    magic = !magic;
                  });
                },
                child: Text(magic ? 'hide' : 'show'))
          ],
        ),
      ),
    );
  }
}
