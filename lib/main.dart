import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
  // People h1 = People(name: 'name');
  // mirror(h1);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: FlutterLogo(),
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(62, 219, 18, 105),
            leading: FlutterLogo(),
            actions: [FlutterLogo(), FlutterLogo()],
            title: Text('Fisrt App')),
        body: Text('data'),
        bottomNavigationBar: FlutterLogo(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Column Example'),
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 71),
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                  Text('Hello'),
                  FlutterLogo(
                    size: 100,
                  ),
                  FlutterLogo(
                    size: 100,
                  )
                ],
              ),
            )));
  }
}
// mirror (Humen humen){
//   return humen;
// }

// class User extends Humen {
//   String name;
//   User({
//     required this.name,
//   });
// }

// class People extends Humen {
//   String name;
//   People({
//     required this.name,
//   });
// }
// abstract class Humen {}
