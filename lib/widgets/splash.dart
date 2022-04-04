import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_pass_1/widgets/home.dart';
import 'package:time_pass_1/widgets/login.dart';
var finalvalue ;
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var finalvalue ;

  void navigationPage() {

     _checkPref().whenComplete(() async {
          Timer(Duration(seconds:1), () {
            finalvalue == null
                ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewApp()))
                : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
          });
        });
   
    // Navigator.of(context)
    //     .pushReplacementNamed('/login'); //namedRoute(App.dart)
  }

  Future _checkPref() async {
    final SharedPreferences _getperfdata =
        await SharedPreferences.getInstance();
    var savedPref = _getperfdata.getString("phonenumber");
    print(savedPref);
    // var accestype = _getperfdata.getString("accesstype");
    setState(() {
      finalvalue = savedPref;
      // finalaccestype = accestype;
    
    });

  }
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/splash/splash.json',
          controller: _controller,
          repeat: true,
          reverse: true,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().then((value) {
                navigationPage();
              });
          },
        ),
      ),
    );
  }
}