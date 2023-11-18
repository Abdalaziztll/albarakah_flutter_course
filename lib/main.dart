import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translation', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
    );
  }
}

List<String> names = [
  'Rabee',
  "Mosab",
  "Nadim",
  "Faris",
  "Kinan",
  "Omar",
  "Madeh",
  "Alaa",
  "Abdullah",
  "Karm",
  "Majd",
  "Mhd"
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int count = 1;

class _HomePageState extends State<HomePage> {
  late List<TextEditingController> controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world').tr(),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (context.locale.languageCode == 'ar') {
                  context.setLocale(Locale('en'));
                } else {
                  context.setLocale(Locale('ar'));
                }
              },
              child: Text('translate').tr())
        ],
      ),

      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  controller =
                      List.generate(count, (index) => TextEditingController());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: controller[index],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: (index + 1).toString()),
                      ),
                    ),
                  );
                }),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
                controller.forEach((element) {
                  print(element.text);
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      // body: ReorderableListView.builder(
      //   itemBuilder: (context, index) => ListTile(
      //     key: GlobalKey(),
      //     title: Text(names[index]),
      //   ),
      //   itemCount: names.length,
      //   onReorder: (oldIndex, newIndex) {
      //     // String temp = names[oldIndex];
      //     // if (oldIndex < newIndex) {
      //     //   names.removeAt(oldIndex);
      //     //   names.insert(newIndex - 1, temp);
      //     // } else {
      //     //   names.removeAt(oldIndex);
      //     //   names.insert(newIndex, temp);
      //     // }

      //     if (oldIndex < newIndex) {
      //       // removing the item at oldIndex will shorten the list by 1.
      //       newIndex -= 1;
      //     }
      //     String temp = names.removeAt(oldIndex);
      //     names.insert(newIndex, temp);
      //   },
      // ),
    );
  }
}
