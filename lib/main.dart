import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: AnimtaionListTile());
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> color;
  late bool isFavorite;
  late Animation<double?> size;
  late Animation<double> sequence;
  late CurvedAnimation curve;

  @override
  void initState() {
    isFavorite = false;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    curve = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(curve);
    size = Tween(begin: 20.0, end: 50.0).animate(curve);
    sequence = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 50.0), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 50.0, end: 20.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 30.0), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 30.0, end: 20.0), weight: 1)
    ]).animate(curve);
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

class AnimtaionListTile extends StatefulWidget {
  const AnimtaionListTile({super.key});

  @override
  State<AnimtaionListTile> createState() => _AnimtaionListTileState();
}

class _AnimtaionListTileState extends State<AnimtaionListTile> {
  late List<Widget> tiles = [];
  GlobalKey<AnimatedListState> keys = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((_) {

    setData();
});
  }

  int index = 1;
  setData() {
    var dataList = [
      {'name': 'Ahmad', 'subname': 'None'},
      {'name': 'Osama', 'subname': 'None'},
      {'name': 'Noor', 'subname': 'None'}
    ];

    Future temporary = Future(() {});

    dataList.forEach((element) {

  temporary =    temporary.then((_) {
        
       return Future.delayed(Duration(milliseconds: 500), () {
          tiles.add(addTile(element));
          keys.currentState!.insertItem(index-1, duration: Duration(seconds: 2));
          index++;
        });

      });
      
    });
  }

  addTile(data) {
    return ListTile(
      title: Text(data['name']),
      subtitle: Text(data['subname']),
    );
  }

  @override
  Widget build(BuildContext context) {
    Tween<Offset> postion = Tween(begin: Offset(1, 0), end: Offset(0, 0));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
      ),
      body: AnimatedList(
        key: keys,
        initialItemCount: tiles.length,
        itemBuilder: (contex, index, animation) => SlideTransition(
            position: animation.drive(postion),
            child: Card(child: tiles[index])),
      ),
    );
  }
}


// import 'dart:math';

// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:flame/palette.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     GameWidget(
//       game: MyGame(),
//     ),
//   );
// }

// /// This example simply adds a rotating white square on the screen.
// /// If you press on a square, it will be removed.
// /// If you press anywhere else, another square will be added.
// class MyGame extends FlameGame with TapCallbacks {
//   @override
//   Future<void> onLoad() async {
//     add(Square(size / 2));
//   }

//   @override
//   void onTapDown(TapDownEvent event) {
//     super.onTapDown(event);
//     if (!event.handled) {
//       final touchPoint = event.canvasPosition;
//       add(Square(touchPoint));
//     }
//   }
// }

// class Square extends RectangleComponent with TapCallbacks {
//   static const speed = 3;
//   static const squareSize = 128.0;
//   static const indicatorSize = 6.0;

//   static final Paint red = BasicPalette.red.paint();
//   static final Paint blue = BasicPalette.blue.paint();

//   Square(Vector2 position)
//       : super(
//           position: position,
//           size: Vector2.all(squareSize),
//           anchor: Anchor.center,
//         );

//   @override
//   void update(double dt) {
//     super.update(dt);
//     angle += speed * dt;
//     angle %= 2 * pi;
//   }

//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//     add(
//       RectangleComponent(
//         size: Vector2.all(indicatorSize),
//         paint: blue,
//       ),
//     );
//     add(
//       RectangleComponent(
//         position: size / 2,
//         size: Vector2.all(indicatorSize),
//         anchor: Anchor.center,
//         paint: red,
//       ),
//     );
//     add(Square(Vector2(12,30),));
//   }

//   @override
//   void onTapDown(TapDownEvent event) {
//     removeFromParent();
//     event.handled = true;
//   }
// }