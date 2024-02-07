import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController text = TextEditingController();

  Future<void> speak() async {
    print(text.text);
    await flutterTts.speak(text.text);
    await _saveSpeechAsAudio(text.text);
  }

  Future<void> _saveSpeechAsAudio(String textToSpeech) async {
    try {
      final directory = await getExternalStorageDirectory();
      final voicesDirectory = Directory('${directory?.path}/voices');
      if (!voicesDirectory.existsSync()) {
        voicesDirectory.createSync();
      }

      final filePath = '${voicesDirectory.path}/speech_${DateTime.now()}.mp3';

      await flutterTts.synthesizeToFile(textToSpeech, filePath);

    } catch (e, stackTrace) {
      print("Error: $e");
      print(stackTrace);
    }
  }
}
