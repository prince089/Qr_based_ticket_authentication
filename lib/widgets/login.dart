import './otp_screen.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewApp extends StatefulWidget {
  @override
  State<NewApp> createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Center(
          child: Text(
            "Phoenix ",
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 3.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Form(
          // key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 5, 25, 5),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _color,
                  ),
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: TextFormField(
                          onChanged: (newValue) {
                            if (newValue.length >= 10 || newValue.length == 0) {
                              // test for your condition
                              setState(() {
                                _color = Colors.black; // change the color
                              });
                            } else {
                              setState(() {
                                _color = Colors
                                    .red; // change the color if the condition is not met
                              });
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 19),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          // validator: (String? value){
                          //   if(value == null || value.isEmpty){
                          //     return "please enter number";
                          //   }
                          // },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Number",
                            prefixIcon: Container(
                              width: 30,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "+91",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 110,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: Text("Next")),
                        Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
