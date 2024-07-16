/// Copyright (c) 2020 arconsis IT-Solutions GmbH
/// Licensed under MIT (https://github.com/arconsis/measurements/blob/master/LICENSE)

import 'dart:ui';

import 'package:document_measure/src/style/point_style.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/rendering.dart';

class PinPointPainter extends material.CustomPainter {
  final Offset start, end;
  
  final Paint dotPaint;


  PinPointPainter(
      {required this.start,
      required this.end,
      
      required this.dotPaint,
      });

  @override
  void paint(Canvas canvas, Size size) {

    // final Paint paint = Paint()..color = Color(0xffFF0000);
    // final Radius radius = Radius.circular(20 / 2);
    // canvas.clipPath(Path()
    //   ..moveTo(0, 20 / 2.7)
    //   ..lineTo(20 / 2, 20.toDouble())
    //   ..lineTo(20.toDouble(), 20 / 2.7)
    //   ..arcToPoint(
    //     Offset(20.toDouble(), 0),
    //   )
    //   ..arcToPoint(const Offset(0, 0)));
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //       Rect.fromLTWH(0.0, 0.0, 20.toDouble(), 20.toDouble()),
    //       topLeft: radius,
    //       topRight: radius,
    //       bottomLeft: radius,
    //       bottomRight: radius,
    //     ),
    //     paint);
    final dx = end.dx - 10;
    final dy = end.dy - 20;

    Path path_1 = Path();
    path_1.moveTo(
      dx +12.031,
    dy +1.0312);
    path_1.cubicTo(
      dx +8.1653,dy +1.0312,
      dx +5.031200000000001,dy +4.1652,
      dx +5.031200000000001,dy +8.0312);
    path_1.cubicTo(
      dx +5.031200000000001,dy +9.414200000000001,
      dx +5.432900000000001,dy +10.696,
      dx +6.125000000000001,dy +11.781);
    path_1.cubicTo(
      dx +6.158400000000001,dy +11.834000000000001,
      dx +6.184000000000001,dy +11.886000000000001,
      dx +6.218800000000001,dy +11.938);
    path_1.lineTo(
      dx +10.562000000000001,dy +20);
    path_1.cubicTo(
      dx +10.766000000000002,dy +20.586,
      dx +11.344000000000001,dy +21.031,
      dx +12.000000000000002,dy +21.031);
    path_1.cubicTo(
      dx +12.656000000000002,dy +21.031,
      dx +13.202000000000002,dy +20.586,
      dx +13.406000000000002,dy +20);
    path_1.lineTo(
      dx +18.250000000000004,dy +11.25);
    path_1.cubicTo(
      dx +18.749000000000002,dy +10.287,
      dx +19.031000000000002,dy +9.19,
      dx +19.031000000000002,dy +8.0312);
    path_1.cubicTo(
      dx +19.031000000000002,dy +4.1652000000000005,
      dx +15.897000000000002,dy +1.0312000000000001,
      dx +12.031000000000002,dy +1.0312000000000001);
    path_1.close();
    path_1.moveTo(
      dx +12,dy +5);
    path_1.cubicTo(
      dx +13.933,dy +5,
      dx +15.5,dy +6.567,
      dx +15.5,dy +8.5);
    path_1.cubicTo(
      dx +15.5,dy +10.433,
      dx +13.933,dy +12,
      dx +12,dy +12);
    path_1.cubicTo(
      dx +10.067,dy +12,
      dx +8.5,dy +10.433,
      dx +8.5,dy +8.5);
    path_1.cubicTo(
      dx +8.5,dy +6.567,
      dx +10.067,dy +5,
      dx +12,dy +5);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xffe74c3c).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);
    
  }

  @override
  bool shouldRepaint(material.CustomPainter oldDelegate) {
    var old = oldDelegate as PinPointPainter;

    return old.start != start || old.end != end;
  }
}
