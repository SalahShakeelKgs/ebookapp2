import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.speak();
        },
        child: Icon(Icons.voice_chat),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Text To Speech',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
            TextField(
              controller: controller.text,
              decoration: InputDecoration(
                hintText: 'Enter text to speech',
              )
            ),

          ]
        ),
      )
    );
  }
}
