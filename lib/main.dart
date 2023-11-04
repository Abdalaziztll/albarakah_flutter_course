import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
      home: SecondPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color.fromARGB(208, 111, 69, 4),
              width: double.maxFinite,
              // height: ,
            ),
            Positioned(
              top: 100,
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 50,
                          color: Colors.orange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 50,
                          color: Colors.orange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 50,
                          color: Colors.orange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 50,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              // ? use with material 3

              // tileColor: Colors.blue,
              isThreeLine: true,
              title: Text('Hello World'),
              leading: FlutterLogo(),
              trailing: Badge(
                isLabelVisible: true,
                label: Text('+999'),
                child: Icon(Icons.facebook)),
              subtitle: Text(
                  'Eu occaecat eu et laborum sit laborum nostrud ipsum ea labore esse.'),
            )
          ],
        ),
      ),
    );
  }
}

List<String> names = ['Ahmad','Majd','Nadim','Rabee','Yaman','Madeh','Ahmad','Majd','Nadim','Rabee','Yaman','Madeh','Ahmad','Majd','Nadim','Rabee','Yaman','Madeh','Ahmad','Majd','Nadim','Rabee','Yaman','Madeh','Ahmad','Majd','Nadim','Rabee','Yaman','Madeh'];

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height: 300,
        child: ListView.separated(
          // childrenDelegate: ,
          separatorBuilder: (context, index) =>Divider(
            color: Colors.red,
            indent: 20,
            endIndent: 30,
            thickness: 10,
            // height: 100,
          ),
          // cacheExtent: 300,
          // itemExtent: 300,
          // scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: names.length,
          // itemBuilder: (context, index) => Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(child: Text(index.toString()),),
          // ),
          itemBuilder: (context, index) => ListTile(
            // tileColor: Colors.red,
            isThreeLine: true,
            title: Text(names[index]),
            leading: CircleAvatar(child: Text(index.toString()),),
            trailing: Badge(
              // smallSize: 10,
              // isLabelVisible: ,
              // alignment: Alignment.topLeft,
              offset: Offset(-20, -8),
              label: Text('+999'),
              child: Icon(Icons.facebook)),
            subtitle: Text(
                'Eu occaecat eu et laborum sit laborum nostrud ipsum ea labore esse.'),
          ),
        ),
      ),
    );
  }
}


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerRight,
        child: FlutterLogo(size: 200,)),
    );
  }
}