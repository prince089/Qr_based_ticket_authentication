// ignore_for_file: must_call_super

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_pass_1/db.dart';
import 'package:http/http.dart' as http;

var number = "";

class CurrentDetailPage extends StatefulWidget {
  final String id;
  final String date;
  final String head;
  final String location;
  final String bcimag;
  final String prize;
  final String totalpeople;
  final String bookedpeople;
  final String organization;
  CurrentDetailPage(
      {required this.head,
      required this.date,
      required this.location,
      required this.bcimag,
      required this.prize,
      required this.bookedpeople,
      required this.totalpeople,
      required this.organization,
      required this.id});

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
  bool isnumberload = false;
  TextEditingController idproof = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController totalnumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();

  // Future submitevent() async{
  //   var db = Mysql2();
  //   var conn = await db.getconnectiondb2();
  //   var verifydoc = "${idproof.text}/${name.text}/${email.text}/${totalnumber.text}/${widget.id}";

  //   var userquery = await conn.query("insert into userdetails (full_name ,phone_number , email ) values (?,?,?)",[name.text, mobilenumber.text,email.text]);
  //   var inserid = userquery.insertId;
  //   var verificdoc = await conn.query("insert into EventRegisterMaster(EventId ,UserId, VerifactiobDoc) values (?,?,?)",[widget.id,inserid,verifydoc]);

  // conn.close();
  // }
  Future submitevent() async {
    print(widget.id.runtimeType);

    var verifydoc =
        "${idproof.text}/${name.text}/${email.text}/${totalnumber.text}/${widget.id}";
    var url = Uri.parse(
        "https://mpbca.000webhostapp.com/applicationUser/regievent.php");
    var responce = await http.post(url, body: {
      "name": name.text,
      "callnumber": mobilenumber.text,
      "email": email.text,
      "eventid": widget.id,
      "userid": name.text,
      "verfydoc": verifydoc
    });

    var data = json.decode(responce.body);

    if (data == "1") {
      setState(() {
        showqrcode = true;
      });
      Fluttertoast.showToast(
        msg: "Meet you there",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 0, 236, 67),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Omfo try later",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void initState() {
    getnumber();
  }

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
                      child: isnumberload
                          ? Column(
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
                                //  TextFormField(
                                //       controller: idproof,
                                //       decoration: InputDecoration(
                                //         labelText: 'Adhar card',
                                //         border: InputBorder.none,
                                //       ),
                                //         keyboardType: TextInputType.number,
                                //        inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                //         LengthLimitingTextInputFormatter(12),],

                                //     ),
                                joinButton(context),
                              ],
                            )
                          : Center(child: CircularProgressIndicator()),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: InputDecoration(labelText: "Name"),
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(labelText: "Email"),
                            ),
                            TextFormField(
                              controller: idproof,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12),
                              ],
                              decoration: InputDecoration(
                                  labelText: "Adharcard Number"),
                            ),
                            TextFormField(
                              controller: mobilenumber,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration:
                                  InputDecoration(labelText: "Mobile number "),
                            ),
                            // TextFormField(),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: totalnumber,
                              decoration: InputDecoration(
                                  labelText: "How many are you"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green, // Background color
                              ),
                              onPressed: () async {
                                await submitevent();
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: showqrcode
                                            ? Column(
                                              children: [
                                                Container(
                                                    child: QrImage(
                                                      data:
                                                          "${idproof.text}/${name.text}/${email.text}/${totalnumber.text}/${widget.id}",
                                                      version: QrVersions.auto,
                                                      size: 200.0,
                                                    ),
                                                  ),
                                                  Container(child: Text("Take screenshot of this qr code"),)
                                              ],
                                            )
                                            : Container(
                                                child: Text(
                                                    "something goes wrong try again"),
                                              ),
                                      );
                                    });
                              },
                              child: Text("Let's Rock on"),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
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

  void getnumber() async {
    final SharedPreferences _getperfdata =
        await SharedPreferences.getInstance();
    var savedPref = _getperfdata.getString("phonenumber");
    // usercode = _getperfdata.getString("username");
    setState(() {
      number = savedPref.toString();
      isnumberload = true;
      // ihostelcode = savedPref.toString();
      // ausercode = usercode;
      // print(ihostelcode);
    });
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
