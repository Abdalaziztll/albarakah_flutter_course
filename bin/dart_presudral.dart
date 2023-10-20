
main() {
  Animal cat = Animal(name: 'katy', color: 'white',position: Position(x: 2, y: 2));
  print(cat.position.y);
  // cat.jump(20);
  print(cat.position.y);

  Animal cat1 =Animal(name: 'katy', color: 'white', position: Position(x: 2, y: 2));

  if(cat==cat1){
    print('Match');
  }
  else {
    print('Not Match');
  }
}

class Animal {
  String name;
  String color;
  
  Position position;

  Animal({required this.name, required this.color, required this.position});

  jump(int height){
   this.position.y = this.position.y + height;
  }
}


class Position {
  int x;
  int y;
  Position({required this.x, required this.y});

}
