main() {


  Car BMW = Car.setupCar(
      releaseTime: 2008, color: 'red', id: 2, model: 'BMW M5', name: 'Fareza');
  print(BMW.ABS);

  BMW.stopUsingABS();  // ? I am try to stop

  Bus bus = Bus(
    countOfPeople: 20,
      name: 'Harsho',
      model: 'Suzuki',
      color: 'green',
      id: 1,
      ABS: false,
      releaseDate: 1899);


bus.stopUsingABS(); // ?  I am a bus sun of the bus
  // Bus harshoBus = Bus(name: 'Harsho', model: 'Suzuki', color: 'green', id: 1, ABS: false, releaseDate: 1899);
  Car bus1 = Bus(
      countOfPeople: 20,
      name: 'name',
      model: 'model',
      color: 'color',
      id: 1,
      ABS: true,
      releaseDate: 2009);

bus1.stopUsingABS();  // ? I am a bus sun of the bus

  // print(harshoBus.name);
}

class Car {
  String name;
  String model;
  String color;
  int releaseDate;
  int id;
  bool ABS;

  Car(
      {required this.name,
      required this.model,
      required this.color,
      required this.id,
      required this.ABS,
      required this.releaseDate});

  stopUsingABS() {
    print('I am try to stop');
  }

  factory Car.setupCar(
      {required int releaseTime,
      required String name,
      required String model,
      required String color,
      required int id}) {
    if (releaseTime > 2007) {
      return Car(
          name: name,
          model: model,
          color: color,
          id: id,
          ABS: true,
          releaseDate: releaseTime);
    } else {
      return Car(
          name: name,
          model: model,
          color: color,
          id: id,
          ABS: false,
          releaseDate: releaseTime);
    }
  }
}

class Bus extends Car {
  int countOfPeople;
  Bus(
      {required super.name,
      required super.model,
      required super.color,
      required this.countOfPeople,
      required super.id,
      required super.ABS,
      required super.releaseDate});

    @override
    stopUsingABS() {
      print('I am a bus, son of the bus');
  }
}

abstract class Creature  {
 
  
  eat();
  drink();
  helperMehod(){
    print('object');
  }
}

class Human extends Creature{

  @override
  drink() {
    // TODO: implement drink
    throw UnimplementedError();
  }

  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }

}

 final class Animal {

 }

//  class Cat extends Animal {}