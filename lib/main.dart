import 'package:bloc_session/bloc/event_example.dart';
import 'package:bloc_session/bloc/manager_example.dart';
import 'package:bloc_session/bloc/state_example.dart';
import 'package:bloc_session/view/bloc/login_bloc.dart';
import 'package:bloc_session/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LogInPage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<ExampleBloc, ExampleState>(
                  builder: (context, state) {
                    if (state is EditNumber) {
                      return Text(state.counter.toString());
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<ExampleBloc>().add(Increment());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<ExampleBloc>().add(Decrement());
                },
                tooltip: 'decrement',
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        );
      }),
    );
  }
}
