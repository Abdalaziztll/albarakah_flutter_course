import 'package:flutter/material.dart';
import 'package:intro_to_uitity/config/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (config.get<SharedPreferences>().getString('title') == null)
            ? HelloPage()
            : HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
            ),
            ElevatedButton(
                onPressed: () {
                  config.get<SharedPreferences>().setString('title', name.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      showCloseIcon: true,
                      closeIconColor: Colors.red,
                      content: Text(
                          'Dolore mollit nulla tempor deserunt consequat culpa dolore id dolore et aliquip deserunt mollit.'),
                    ),
                  );
                },
                child: Text('WhatEver'))
          ],
        ),
      ),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(config.get<SharedPreferences>().getString('title') ?? "Hello"),
      ),
      body: Center(
        child: Text(config.get<DateTime>().minute.toString()),
      ),
    );
  }
}
