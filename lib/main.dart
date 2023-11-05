import 'package:controller_types/config/router/go_route.dart';
import 'package:controller_types/model/cart_model.dart';
import 'package:controller_types/service/cartd_service.dart';
import 'package:controller_types/service/graphql/graphql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

main() async{
  await initHiveForFlutter();
  
 await getData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CardService().getCarts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            CardModel cards = CardModel.fromMap(temp.data);

            return DefaultTabController(
              length: cards.Carts.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('TabBar Example'),
                  bottom: TabBar(
                      tabs: List.generate(
                          cards.Carts.length,
                          (index) => Tab(
                                icon: Icon(Icons.leaderboard),
                              ))),
                ),
                body: TabBarView(
                  children:
                      List.generate(cards.Carts.length, (index) => Scaffold()),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(tabs: [
            Icon(Icons.percent),
            Icon(Icons.percent),
            Icon(Icons.percent)
          ]),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          InkWell(
            onTap: () {
              context.go('/testpage');
            },
            child: Container(
              color: Colors.green,
            ),
          )
        ]),
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
