import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speech_recognation_app/data_model.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchSpeechController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  var isListening = false.obs;
  var searchController = TextEditingController();
  var dataModel = dataModelList;

  @override
  void onInit() {
    super.onInit();
    speechToText.initialize();
    searchController.addListener(() {
      runFilter(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  listen() async {
    if (!isListening.value) {
      isListening.value = true;
      searchController.text = "";
      await speechToText.listen(
        onResult: (result) => searchController.text = result.recognizedWords,
        localeId: "en-US",
      );
    } else {
      isListening.value = false;
      await speechToText.stop();
    }
  }

  void runFilter(String enteredKeyword) {
    List<DataModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = dataModel;
    } else {
      results = dataModel.where((dictionary) {
        return dictionary.name
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase());
      }).toList();
    }
    dataModel = results;
  }
}
