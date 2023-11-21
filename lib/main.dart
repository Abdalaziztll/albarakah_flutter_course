import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_example/controller/comment_contoller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentContoller());
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text('count ${controller.counter.toString()}'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.isLoading.isFalse
                ? CircularProgressIndicator()
                : Text(controller.data.toString())),
            ElevatedButton(
                onPressed: () {
                  controller.increamnt();
                  // Get.to(FirstPage());
                  controller.getData();
                  // Get.dialog(FlutterLogo());

                  // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: content))
                  Get.showSnackbar(new GetSnackBar(message: 'Hello Wolrd'));
                },
                child: Text('add')),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextField(
          controller: TextEditingController(),
        ),
      ),
    );
  }
}
