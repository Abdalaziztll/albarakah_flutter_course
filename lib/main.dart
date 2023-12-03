import 'package:first_project/text_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyTextFormField(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController username;
  late TextEditingController password;
  // TextEditingController username = TextEditingController();
  // TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        // onChanged: () {
        //   Form.of(primaryFocus!.context!).save();
        // },
        key: formkey,
        child: ListView(
          children: [
            Container(
              child: TextFormField(
                // key: key,
                // controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  return valedate(val);
                },
              ),
            ),
            Container(
              child: TextFormField(
                // key: key,
                // controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  return valedate(val);
                },
              ),
            ),
            InkWell(
              child: Container(
                child: Text("validate"),
              ),
              onTap: () {
                // if (formkey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}

valedate(String? value) {
  if (value!.isEmpty || value == "nadim") {
    return "null";
  }
}
