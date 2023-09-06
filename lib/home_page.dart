import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_recognation_app/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  homeController.text.value,
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            ],
          );
        }),
        floatingActionButton: Obx(() {
          return FloatingActionButton(
            onPressed: homeController.listen,
            child: Icon(
                homeController.isListening.value ? Icons.rectangle : Icons
                    .mic),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
