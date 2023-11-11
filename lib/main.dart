import 'dart:math';

import 'package:builder_session/model/comment_model.dart';
import 'package:builder_session/service/get_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
        home: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 500) {
              return StreamBuilderExample();
            } else {
              // return FutureBuilderExample();
              return BottomNavBarExample();
            }
          },
        ));
  }
}

// ! HomeWork:
// TODO : http://jsonplaceholder.typicode.com/photos
class FutureBuilderExample extends StatelessWidget {
  const FutureBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;

            List<CommentModel> result = List.generate(temp.data.length,
                (index) => CommentModel.fromMap(temp.data[index]));

            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      leading: Image.network(
                          'https://via.placeholder.com/150/92c952'),
                      title: Text(result[index].name),
                      subtitle: Text(result[index].body),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: result.length);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}

class StreamBuilderExample extends StatelessWidget {
  const StreamBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getStream(1000),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            return Center(
              child: Transform.rotate(
                angle: (pi / temp) * 0.1,
                child: Container(
                  width: 10,
                  height: 200,
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}

Stream<num> getStream(int count) async* {
  for (num i = 2; i < count; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

int selectedIndex = 0;

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          elevation: 0,
          indicatorColor: Colors.orange,
          indicatorShape: CircleBorder(),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 3),
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
                tooltip: null,
                selectedIcon: Icon(Icons.facebook),
                icon: Icon(Icons.home),
                label: 'HomePage'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Setting')
          ],
        ));
  }
}

List<Widget> pages = [
  Scaffold(
    backgroundColor: Colors.red,
  ),
  Scaffold(
    backgroundColor: Colors.blue,
  ),
  Scaffold(
    backgroundColor: Colors.amber,
  ),
  Scaffold()
];
