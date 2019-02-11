
import 'package:flutter/widgets.dart';

class MyPaintView extends CustomPainter {

  final Paint _paint = Paint();

  MyPaintView() {
    _paint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}