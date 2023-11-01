import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
        home: PageView(
          physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: [
        HomePage(),
        Scaffold(
          body: Container(
            color: Colors.red,
          ),
        ),
        Scaffold(
          body: Container(
            color: Colors.blue,
          ),
        ),
        Scaffold(
          body: Container(
            color: Colors.green,
          ),
        )
      ],
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController password =TextEditingController();
    return Scaffold(
        body: Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 300,
              child: TextField(
                controller: password,
                // onChanged: (value) {
                //   print(value);
                // },
                // maxLines: 3,
                obscureText: true,
                decoration: InputDecoration(
                    // filled: true,
                    fillColor: Colors.red,
                    icon: Icon(Icons.remove_red_eye),

                    // prefixIcon: FlutterLogo(),
                    // prefix: FlutterLogo(),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: Icon(Icons.password),
                    hintText: ' password',
                    // labelText: 'Username',
                    helperText: 'please enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
              InkWell(
                onTap: (){
                  if(password.text.length < 10){
                    
                  }else {
                    controller.nextPage(duration: Duration(seconds: 2), curve: Curves.bounceInOut);
                  }
                },
                child: FlutterLogo())
        ],
      ),
    ));
  }
}
