import 'package:flutter/material.dart';

class CustomClipperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomClipperWidget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomClipperWidget'),
        ),
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                color: Colors.deepPurpleAccent,
                height: 200.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
//    path.lineTo(0, 0);
//    path.lineTo(0, size.height - 60);
//
//    var firstControlPoint = Offset(size.width / 2, size.height);
//    var firstEndPoint = Offset(size.width, size.height - 60);
//
//    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
//    path.lineTo(size.width, size.height - 60);
//    path.lineTo(size.width, 0);
    
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPath = Offset(size.width / 4 * 3, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height);

    path.quadraticBezierTo(secondControlPath.dx, secondControlPath.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}