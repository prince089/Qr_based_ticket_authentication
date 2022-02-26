// ignore_for_file: unnecessary_new
import 'package:mysql1/mysql1.dart';
class Mysql {
  static String host = 'localhost',user = 'id18478088_mpbca9689',password='Holakagola@123',db = 'id18478088_mpbca';
  static int port = 3306;
  Mysql();
  Future<MySqlConnection> getconnection() async{
    var setting = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );
    return await MySqlConnection.connect(setting);
  }

}