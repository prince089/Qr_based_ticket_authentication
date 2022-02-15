// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrentDetailPage extends StatelessWidget {
  final DateTime date;
  final String head;
  final String location;
  final String bcimag;
  final double prize;
  final int totalpeople;
  final int bookedpeople;
  final String organization;
  const CurrentDetailPage({
    required this.head,
    required this.date,
    required this.location,
    required this.bcimag,
    required this.prize,
    required this.bookedpeople,
    required this.totalpeople,
    required this.organization,
  });
  bool prizedefine(double prize) {
    if (prize == 0.0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final event = Provider.of<Event>(context);

    return Scaffold(
      appBar: AppBar(
        // title: Text(head),
        backgroundColor: Colors.green[400],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: ImageClipper(),
              child: Image.asset(
                "assets/main/$bcimag",
                fit: BoxFit.cover,
                width: screenWidth,
                color: Color(0x99000000),
                colorBlendMode: BlendMode.darken,
                height: screenHeight * 0.5,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.3),
              Container(
                // height : double.infinity,
                // decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        head,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        DateFormat.MMM().format(date),
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        DateFormat.d().format(date),
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        prizedefine(prize) ? "Free" : prize.toString(),
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people),
                          SizedBox(width: 5,),
                          Text("${bookedpeople.toString()} / ${totalpeople.toString()}"),
                          // SizedBox(width: 10,),
                          // Text(totalpeople.toString()),
                        ],
                      ),
                      Text(organization)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    // path.quadraticBezierTo(size.width * 0.99, size.height * 0.99, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
