import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_recognation_app/home_page.dart';
import 'package:speech_recognation_app/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/search',
          getPages: [
            GetPage(
              name: '/home',
              page: () => HomePage(),
            ),
            GetPage(
              name: '/search',
              page: () => SearchPage(),
            )
          ],
        );
      },
    );
  }
}
