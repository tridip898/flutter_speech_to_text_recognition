import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  var isListening = false.obs;
  var text = "".obs;

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
