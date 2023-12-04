import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImplicitAnimtaion(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 200;
  Color color = Colors.blue;
  double red = 2;
  int index = 0;
  double opic = 1;
  double padd = 8;
  List<Color> colors = [Colors.yellow, Colors.red];
  String img = 'abo_abdo/cat0.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedPadding(
        padding: EdgeInsets.all(padd),
        duration: Duration(seconds: 20),
        child: AnimatedContainer(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img)),
              color: color,
              borderRadius: BorderRadius.circular(red),
              gradient: LinearGradient(colors: colors)),
          duration: Duration(seconds: 2),
          width: width,
          height: 800,
          child: AnimatedOpacity(
            opacity: opic,
            duration: Duration(seconds: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        padd = 100;
                        opic = 0;
                        index = index + 1;
                        width = width + 100;
                        color = Colors.green;
                        red = red + 25;
                        img = 'abo_abdo/cat${index}.jpg';
                        colors.replaceRange(0, 2, [Colors.blue, Colors.pink]);
                      },
                    );
                  },
                  icon: Icon(Icons.zoom_in)),
            ),
          ),
        ),
      ),
    );
  }
}

// implicit: AnimtedConiater / Hero / AnimatedPadding /
// explicit
List<Map<String, String>> data = [
  {
    "cat 0": 'abo_abdo/cat0.jpg',
    "cat 1": 'abo_abdo/cat1.jpg',
    "cat 2": 'abo_abdo/cat2.jpg'
  }
];

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: data[0].keys.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HeroSecondExample(
                index: index,
              ),
            ),
          );
        },
        leading: Hero(
            tag: index, child: Image.asset(data[0].values.elementAt(index))),
        title: Text(
          data[0].keys.elementAt(index),
        ),
      ),
    ));
  }
}

class HeroSecondExample extends StatelessWidget {
  HeroSecondExample({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(tag: index, child: Image.asset('abo_abdo/cat${index}.jpg'))
        ],
      ),
    );
  }
}

class ImplicitAnimtaion extends StatelessWidget {
  const ImplicitAnimtaion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
          tween: Tween<double>(begin: 1, end: 3),
          duration: Duration(seconds: 6),
          builder: (context, val, child) {
            return Padding(
              padding: EdgeInsets.all(val*8),
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.all(val*12),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: child),
                ),
                width: val*100,
                height: val*100,
                color: Color.fromRGBO( 50*val.toInt(), 10*val.toInt(), 80*val.toInt(), 1),
              ),
            );
          },
          ),
    );
  }
}
