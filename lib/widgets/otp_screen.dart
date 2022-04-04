import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_pass_1/widgets/home.dart';

class OtpVarifacation extends StatefulWidget {
  var mobile;
  OtpVarifacation({Key? key, required this.mobile}) : super(key: key);

  @override
  _OtpVarifacationState createState() => _OtpVarifacationState();
}

class _OtpVarifacationState extends State<OtpVarifacation> {
  int start = 30;
  late String phoneController;
  late String verificationId;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otpcontroler = TextEditingController();

  Future _setotp() async {
    phoneController = widget.mobile;

    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.toString()}",
      verificationCompleted: (phoneAuthCredential) async {},
      verificationFailed: (verificationFailed) async {},
      codeSent: (verificationId, resendingToken) async {
        setState(() {
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      // showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        // showLoading = false;
      });

      if (authCredential.user != null) {
        _setPref();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        // showLoading = false;
      });

      // _scaffoldKey.currentState
      //     ?.showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  Future _setPref() async {  
    final spobj = await SharedPreferences.getInstance();
    spobj.setString("phonenumber", phoneController);
  }


  @override
  void initState() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
      phoneController = widget.mobile;
      _setotp();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Center(
            child: Text(
              "Verify your self",
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 3.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
              ),
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "OTP",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: otpcontroler,
                              decoration: InputDecoration(
                                labelText: "Enter OTP here",
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // backgroundColor: Color,
                                primary: Colors.green[400],
                              ),
                              onPressed: () async {
                                PhoneAuthCredential phoneAuthCredential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId,
                                        smsCode: otpcontroler.text);

                                signInWithPhoneAuthCredential(
                                    phoneAuthCredential);
                              },
                              child: Text("VERIFY"),
                            )
                          ],
                        ),
                        //             child: OTPTextField(
                        //               length: 6,
                        //               width: MediaQuery.of(context).size.width,
                        //               //fieldWidth: 80,
                        //               style: TextStyle(fontSize: 10),
                        //               textFieldAlignment: MainAxisAlignment.spaceAround,
                        //               fieldStyle: FieldStyle.underline,
                        //               onCompleted: (pin) async{
                        //                 // print("Completed: " + pin);
                        //                 PhoneAuthCredential phoneAuthCredential =
                        //     PhoneAuthProvider.credential(
                        //         verificationId: verificationId,
                        //         smsCode: pin);

                        // signInWithPhoneAuthCredential(phoneAuthCredential);

                        //               },
                        //             ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't get OTP yet resend in ",
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                            TextSpan(
                              text: "00:$start",
                              style: TextStyle(
                                color: Colors.blue[600],
                              ),
                            ),
                            // TextSpan(
                            //   text: "",
                            //   style: TextStyle(
                            //     color: Colors.grey[400],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void timer() {}
}
