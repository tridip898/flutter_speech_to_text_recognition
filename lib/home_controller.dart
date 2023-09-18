import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  var isListening = false.obs;
  var text = "".obs;
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];
  @override
  void onInit() {
    super.onInit();
    speechToText.initialize();
  }

  listen() async {
    if (!isListening.value) {
      isListening.value = true;
      text.value="";
      await speechToText.listen(
        onResult: (result) => text.value = result.recognizedWords,
        localeId: "bn-BD",
      );
    } else {
      isListening.value = false;
      await speechToText.stop();
    }
  }
}
