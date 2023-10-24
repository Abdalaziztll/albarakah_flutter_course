import 'package:bloc_session/bloc/event_example.dart';
import 'package:bloc_session/bloc/state_example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int counter = 0;

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(InitState()) {
    
    on<Increment>(
      (event, emit) {
        emit(EditNumber(counter: counter =counter + 1));
      },
    );

    on<Decrement>((event, emit) {
      if (counter > 0){
      emit(EditNumber(counter: counter  =counter- 1));

      }
      else {

      emit(InitState());
      }
    });
  }
}
