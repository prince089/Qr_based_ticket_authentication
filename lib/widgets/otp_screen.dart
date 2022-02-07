import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVarifacation extends StatefulWidget {
  OtpVarifacation({Key? key}) : super(key: key);

  @override
  _OtpVarifacationState createState() => _OtpVarifacationState();
}

class _OtpVarifacationState extends State<OtpVarifacation> {
  int start = 30;
  @override
  void initState(){
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
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          //fieldWidth: 80,
                          style: TextStyle(fontSize: 10),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
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

  void timer() {
    
  }
}
