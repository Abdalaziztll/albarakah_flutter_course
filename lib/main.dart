import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: 
    PageView(
      children: [
        HomePage(),
        
        HomePage(),
      ],
    )
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 200,
                // top:40
              ),
              child: Text('Skip'),
            ),
            Image.asset('asset/cuate.png'),
            Text('Write List'),
            Text(
                'Sit dolor enim cillum commodo\n sint exercitation ex ullamco qui sunt.'),
            Container(
              width: 100,
              child: Row(
                children: [FlutterLogo(), FlutterLogo(), FlutterLogo()],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [ Colors.blue,Colors.black],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              width: 200,
              height: 54,
            )
          ],
        ),
      ),
    );
  }
}
