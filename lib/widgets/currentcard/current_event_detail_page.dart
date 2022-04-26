import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CurrentDetailPage extends StatefulWidget {
  final String date;
  final String head;
  final String location;
  final String bcimag;
  final String prize;
  final String totalpeople;
  final String bookedpeople;
  final String organization;
  CurrentDetailPage({
    required this.head,
    required this.date,
    required this.location,
    required this.bcimag,
    required this.prize,
    required this.bookedpeople,
    required this.totalpeople,
    required this.organization,
  });

  @override
  State<CurrentDetailPage> createState() => _CurrentDetailPageState();
}

class _CurrentDetailPageState extends State<CurrentDetailPage> {
  bool prizedefine(double prize) {
    if (prize == 0.0) {
      return true;
    } else {
      return false;
    }
  }

  bool showqrcode = false;
  TextEditingController idproof = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // final event = Provider.of<Event>(context);

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Stack(
            children: [
              halfBackground(screenWidth, screenHeight),
              // SizedBox(height: screenHeight * 0.3),
              Padding(
                padding: const EdgeInsets.only(
                    top: 250, left: 30, right: 30, bottom: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: 380,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          smallavatar(),
                          SizedBox(
                            height: 10,
                          ),
                          evhead(),
                          evOrgenization(),
                          SizedBox(
                            height: 10,
                          ),
                          evDescripion(),
                          SizedBox(
                            height: 30,
                          ),
                          dataDate(),
                          SizedBox(height: 20),
                          dataTime(),
                          SizedBox(
                            height: 20,
                          ),
                          dataVanue(),
                          joinButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center evOrgenization() =>
      Center(child: Text("Orgenized by ${widget.organization}"));

  Padding joinButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      // height: 200,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: idproof,
                                decoration: InputDecoration(
                                  labelText: 'Id proof ',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showqrcode = true;
                              });
                            },
                            child: Text("Rock on !"),
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: Color,
                              primary: Colors.green[400],
                            ),
                          ),
                          Container(
                            child: showqrcode
                                ? Container(
                                    child: QrImage(
                                      data: idproof.toString(),
                                      version: QrVersions.auto,
                                      size: 320,
                                      gapless: false,
                                    ),
                                  )
                                : Container(),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text(
            "Register",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(94, 194, 120, 1),
              onPrimary: Color.fromRGBO(234, 237, 217, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )),
        ),
      ),
    );
  }

  Padding dataVanue() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Vanue : ",
          ),
          Flexible(
            child: Text(widget.location),
          )
        ],
      ),
    );
  }

  Padding dataTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Time :",
          ),
          Text(widget.date)
        ],
      ),
    );
  }

  Padding dataDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Date : ",
          ),
          Text(widget.date)
        ],
      ),
    );
  }

  Row evDescripion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            widget.location,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Row evhead() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.head,
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row smallavatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://mpbca.000webhostapp.com/addon/event_form_images/IMG_0083.JPG'),
          radius: 30,
        ),
      ],
    );
  }

  Align halfBackground(double screenWidth, double screenHeight) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.network(
          "https://mpbca.000webhostapp.com/addon/event_form_images/IMG_0083.JPG",
          fit: BoxFit.cover,
          width: screenWidth,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          height: screenHeight * 0.5,
        ),
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
