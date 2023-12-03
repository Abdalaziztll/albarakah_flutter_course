import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key});
  TextEditingController ctrl = TextEditingController();
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: ctrl,
            onChanged: (String? val) {
              print(val);
              value = val;
            },
          ),
          InkWell(
            onTap: () {
              if (value == null || value!.isEmpty) {
                print("null");
              }
            },
            child: Text('Validate'),
          )
        ],
      ),
    );
  }
}

class MyTextFormField extends StatefulWidget {
  MyTextFormField({super.key});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dada;

  @override
  void initState() {
    dada = TextEditingController();
    print("init");
    super.initState();
  }

  @override
  void dispose() {
    dada.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                suffix: Text('data'),
                hintText: "username",
                border: OutlineInputBorder(),
              ),
              validator: (String? value) {
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!)) {
                  return "Success";
                }
              },
            ),
            TextFormField(
              validator: (String? value) {
                if (!value!.contains("@")) {
                  return "it is not email";
                }
              },
              obscureText: false,
              decoration: InputDecoration(
                hintText: "email",
                border: OutlineInputBorder(),
              ),
            ),
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {}
              },
              child: Text(
                "Validate",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? vali(String? val) {
  if (!val!.contains("@")) {
    return "it is not email";
  }
  if (!val!.contains("@")) {
    return "it is not email";
  }
}
