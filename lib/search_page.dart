import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_recognation_app/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final controller = Get.put(SearchSpeechController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: controller.searchController.text == ""
                    ? "Search Here"
                    : controller.searchController.text,
                suffixIcon: IconButton(
                  onPressed: controller.listen,
                  icon: Icon(controller.isListening.value
                      ? Icons.mic
                      : Icons.mic_none),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.pinkAccent,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.pinkAccent,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.pinkAccent,
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.dataModel[index].name),
                    subtitle: Text(controller.dataModel[index].designation),
                    trailing: Text(controller.dataModel[index].salary),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5.h,
                  );
                },
                itemCount: controller.dataModel.length,
              ),
            )
          ],
        );
      }),
    );
  }
}
