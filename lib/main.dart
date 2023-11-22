import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewExample(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanaded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ExpansionTile(
          initiallyExpanded: (index == 1) ? isExpanaded : !isExpanaded,
          onExpansionChanged: (value) {
            setState(() {
              isExpanaded = !value;
            });
          },
          trailing: InkWell(onTap: () {}, child: Icon(Icons.add)),
          leading: FlutterLogo(),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('Hello ${index}'),
          children: [
            ListTile(
              title: Text('1'),
            ),
            ListTile(
              title: Text('1'),
            ),
            ListTile(
              title: Text('1'),
            ),
          ]),
    ));
  }
}

class SliversExample extends StatefulWidget {
  const SliversExample({super.key});

  @override
  State<SliversExample> createState() => _SliversExampleState();
}

class _SliversExampleState extends State<SliversExample> {
  double hi = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlutterLogo(),
          Container(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  // stretch: true,
                  // pinned: true,
                  floating: true,
                  snap: true,
                  title: Text('Hello'),
                  expandedHeight: 200,
                ),
                SliverList.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(index.toString()),
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: SizedBox(
                //     width: double.maxFinite,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) => Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: FlutterLogo(
                //           size: 50,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SliverList.builder(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlutterLogo(
                            size: 50,
                          ),
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    return Scaffold(
      body: GridView.builder(
        itemCount: 10,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            color: color,
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 5,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            crossAxisSpacing: 30),
      ),
    );
  }
}
