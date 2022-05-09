// ignore_for_file: unnecessary_new
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysql1/mysql1.dart';
class Mysql2 {
  static String host = 'localhost',user = 'id18478088_mpbca9689',password='Holakagola@123',db = 'id18478088_mpbca';
  static int port = 3306;
  Mysql2();
  Future<MySqlConnection> getconnectiondb2() async{
    var setting = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );
    try {
      return await MySqlConnection.connect(setting);
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
              msg: "semething went wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
      );
    }
    return await MySqlConnection.connect(setting);
  }

}