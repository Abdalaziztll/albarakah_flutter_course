import 'package:test/test.dart';

void main() async {


  String? name ;
  print(name);


// Future response =  fakeQuery();

// print('------');

// String response2= await anoutherFakeQuery();

// print(response2);

//  print(await response);

// dynamic result = addTwoNumber(firstNumber: 3, secondNumber:6);

// print(result);

  Function multiplyNumber =
      (int firstNumber, int secondNumber) => firstNumber * secondNumber;


    Function priner =  () => print("hello");

    priner();

  Function multiplyNumber2 =
      (int firstNumber, int secondNumber) {
        
      return   firstNumber * secondNumber;
      };

    print(multiplyNumber2(5,5));

  addTwoNumber(firstNumber: 3, helperMethod: ()=> multiplyNumber(3,4));
}

// ? Stream myStream ;
// ? async*
// ? yeild

Future<String> fakeQuery() async {
  await Future.delayed(Duration(seconds: 6));

  return 'Ahmad';
}

Future<String> anoutherFakeQuery() async {
  await Future.delayed(Duration(seconds: 4));

  return 'Nadem';
}

void addTwoNumber({required num firstNumber, required Function helperMethod}) {
  num result = firstNumber + helperMethod();

  print(result);
}
