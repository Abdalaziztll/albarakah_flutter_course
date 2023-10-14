
import 'dart:async';

import 'package:test/test.dart';

 main()   {
  Stream counter =   dataServiceFlow();

  counter.listen((event) {
    print(event);
  });

StreamController controller = StreamController() ;
  dataServiceFlowEdit(controller).listen((event){
    print(event);
  });


// ?  list  methods
// String name = "MHD";
// List<String> names = ["Ahmad","Ali"];

// names.add(name);

// print(names);

// for (int i = 0; i < names.length; i++) {
// print(names[i]);
// }

// for (var item in names) {
//   print(item);
// }

// names.forEach((e) { 
//   print(e);
// });


//? oop intro
// Animal cat = Animal(name: 'katy', color: 'black', type: 'home cat',catPosition: Position(x: 5,y: 5));

// // print(cat.catPosition.showPostion());
// // cat.jump(10);
// // print(cat.catPosition.showPostion());

// Animal cat1 = Animal(name: 'katy', color: 'black', type: 'home cat', catPosition: Position(x: 5,y: 5));

// if(cat == cat1){

//   print("matching");
// }
// else {
//   print("Not Match");
//   }

}

class Animal {
  String name;
  String color;
  String type;
  Position catPosition;

  Animal({
    required this.name,
    required this.color,
    required this.type,
    required this.catPosition,
  });

  jump(int height){
   this.catPosition.y = this.catPosition.y + height;
  }
}

class Position {
  int x;
  int y;
  Position({
    required this.x,
    required this.y,
  });

  showPostion(){
    return (this.x , this.y);
  }

}

// ? stream
dataServiceFlow()async*{
for (var i = 0; i < 20; i++) {
  await Future.delayed(Duration(seconds: 1));
  yield i;
}}


dataServiceFlowEdit(StreamController streamer)async*{
for (var i = 0; i < 20; i++) {
  await Future.delayed(Duration(seconds: 1));
  streamer.sink.add(i);
}

}