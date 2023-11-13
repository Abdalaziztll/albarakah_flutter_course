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
            ? LogInPage()
            : HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectindex = 2;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectindex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectindex,
          onDestinationSelected: (value) {
            setState(() {
              selectindex = value;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'label'),
            NavigationDestination(icon: Icon(Icons.home), label: 'label'),
            NavigationDestination(icon: Icon(Icons.home), label: 'label'),
          ]),
    );
  }
}

List<Widget> pages = [
  Scaffold(
    backgroundColor: Colors.red,
  ),
  Scaffold(
    backgroundColor: Colors.blue,
  ),
  ExamplePage()
];

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
              config.get<SharedPreferences>().getString('title') ?? "Hello"),
          bottom: TabBar(tabs: [
            Tab(text: 'Cats'),
            Tab(text: 'Dogs'),
            Tab(text: 'Horse'),
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: FlutterLogo(),
          ),
          Center(
            child: FlutterLogo(size: 200),
          ),
          Center(
            child: FlutterLogo(
              size: 400,
            ),
          )
        ]),
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();

    TextEditingController password = TextEditingController();
    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'pasword',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () async {
                  print('${username.text} + ${password.text}');
                  if (username.text.contains('a') &&
                      password.text.contains('123321')) {
                    // whatever = username.text;
                    config
                        .get<SharedPreferences>()
                        .setString('title', username.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: FlutterLogo())
          ],
        ),
      ),
    );
  }
}

// String whatever = "";
