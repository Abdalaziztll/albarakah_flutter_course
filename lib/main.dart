import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExlpicitExample(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // late AnimationController controller ;
  GlobalKey<AnimatedListState> keys = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      buildTiles();
    });
  }

  List tiles = [];

  List<String> data = ['Abdalaziz', "Noor", "Hamza", "Ali", "Yaser"];

  Widget addTile(String title) {
    return ListTile(
      title: Text(title),
    );
  }

  int index = 0;
  Future ft = Future(() => null);
  buildTiles() {
    data.forEach((element) {
      ft = ft.then((value) {
        return Future.delayed(Duration(seconds: 1), () {
          tiles.add(addTile(element));
          keys.currentState!.insertItem(index);
          index++;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Tween<Offset> offset = Tween(begin: Offset(1, 3), end: Offset(0, 0));
    return Scaffold(
      body: AnimatedList(
        key: keys,
        initialItemCount: tiles.length,
        itemBuilder: (context, index, animation) => SlideTransition(
          position: animation.drive(offset),
          child: Card(
            child: tiles[index],
          ),
        ),
      ),
    );
  }
}

class ExlpicitExample extends StatefulWidget {
  const ExlpicitExample({super.key});

  @override
  State<ExlpicitExample> createState() => _ExlpicitExampleState();
}

class _ExlpicitExampleState extends State<ExlpicitExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colors;
  late Animation<dynamic> size;
  late CurvedAnimation curve;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    curve = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    colors =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(curve);
    size = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 20.0, end: 40.0), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 40.0, end: 30.0), weight: 1),
      
      TweenSequenceItem<double>(tween: Tween(begin: 30.0, end: 40.0), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 40.0, end: 30.0), weight: 1)
    ]).animate(curve);


    curve.addStatusListener((state) {
      print(state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(

          animation: curve,
          builder: (context, _) {
            return Center(
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: colors.value,
                  size: size.value,
                ),
                onPressed: () {

                  controller.forward();
                  
                },
              ),
            );
          }),
    );
  }
}
