import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;

  const MyTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ? Colors.pinkAccent : Colors.pinkAccent.shade100),
        indicatorStyle: IndicatorStyle(
          color: isPast ? Colors.pinkAccent : Colors.pinkAccent.shade100,
          width: 30,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: Colors.white,
          ),
        ),
        endChild: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
          margin: EdgeInsets.symmetric(horizontal:10.w),
          decoration: BoxDecoration(
            color:  isPast ? Colors.pinkAccent : Colors.pinkAccent.shade100,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text("data"),
        ),
      ),
    );
  }
}
