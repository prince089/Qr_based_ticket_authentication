import 'package:time_pass_1/widgets/login.dart';
//import 'widgets/otp_screen.dart';
import 'widgets/splash.dart';
import 'widgets/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute :'/',
      routes:{
      '/' :(context) => SplashScreen( ),
      '/login':(context) => NewApp( ),
      '/home' :(context)=> Home( ),
      },
    ),
  );
}
