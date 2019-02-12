
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/base_page.dart';

class MyCustomView extends BasicPage<_MyCustomViewState> {

  MyCustomView():super(title:'MyCustomPaint');

  @override
  _MyCustomViewState createBaseUiState() => _MyCustomViewState();
}

class _MyCustomViewState extends BasePageState {
  @override
  Widget createBody() {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.red,
      child: CustomPaint(
        painter: _MyCustomPainter(),
      ),
    );
  }
}

class _MyCustomPainter extends CustomPainter {

  final Paint _paint = Paint();

  _MyCustomPainter() {
    _paint.isAntiAlias = true;
    _paint.color = Colors.white;
    _paint.strokeWidth = 10;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var dx = size.width/2.0;
    var dy = size.height/2.0;
    canvas.drawCircle(Offset(dx, dy), 20, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}