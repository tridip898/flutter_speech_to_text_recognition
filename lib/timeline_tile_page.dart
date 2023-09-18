import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_recognation_app/widget/my_timeline_tile_widget.dart';

class TimelineTilePage extends StatelessWidget {
  const TimelineTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //   child: Text("Timeline Tile")
            //       .animate()
            //       .tint(color: Colors.pinkAccent, duration: Duration(seconds: 2))
            //       .then()
            //       .shake(),
            // ),
            Center(
              child: Text("Timeline Tile")
                  .animate()
                  .fade(duration: Duration(milliseconds: 5000))
                  .shakeX(delay: 5000.milliseconds)
                  .tint(color: Colors.pinkAccent, delay: 10000.milliseconds),
            ),
            const MyTimelineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
            ),
            const MyTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
            ),
            const MyTimelineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
            ),
          ],
        ),
      ),
    );
  }
}
