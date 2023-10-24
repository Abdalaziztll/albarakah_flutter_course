abstract class ExampleState {
}

class InitState extends ExampleState {}

class EditNumber extends ExampleState {
  int counter;
  EditNumber({
    required this.counter,
  });
}
