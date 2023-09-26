import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Color color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Draggable<Color>(
                data: Colors.green,
                feedback: Container(
                  height: 200,
                  width: 200,
                  color: Colors.pinkAccent,
                  child: Text("Dragging"),
                ),
                childWhenDragging: Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellow,
                  child: Text("Empty"),
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                  child: Text("Draggable"),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            DragTarget<Color>(
              onAccept: (data) {
                setState(() {
                  color = data;
                });
              },
              builder: (context, _, __) {
                return Container(
                  height: 200,
                  width: 200,
                  color: color,
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            PhysicalModel(
              color: Colors.purple,
              shadowColor: Colors.black,
              elevation: 30,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
