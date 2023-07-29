import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    double width= size.width;
    double height = size.height;

    final path =Path();







    path.moveTo(0,0);
    path.lineTo(0,size.height);
    path.quadraticBezierTo(size.width*0.1814375,size.height*1.0058600,size.width*0.2481875,size.height*0.9966600);
    path.cubicTo(size.width*0.3204500,size.height*0.9967400,size.width*0.3124625,size.height*0.9524800,size.width*0.3117000,size.height*0.9005800);
    path.cubicTo(size.width*0.3143000,size.height*0.5434600,size.width*0.6868500,size.height*0.5603600,size.width*0.6874875,size.height*0.9039200);
    path.cubicTo(size.width*0.6880875,size.height*0.9462400,size.width*0.6667125,size.height*1.0010400,size.width*0.7484125,size.height);
    path.quadraticBezierTo(size.width*0.8332125,size.height*1.0031600,size.width,size.height);
    path.lineTo(size.width,0);
    path.lineTo(0,0);
    path.close();








    return path;}
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
    throw UnimplementedError();
  }
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
