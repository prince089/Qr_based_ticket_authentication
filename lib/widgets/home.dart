import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:time_pass_1/module/db/config.dart';
import 'package:time_pass_1/widgets/currentcard/current_event_detail_page.dart';
import 'package:time_pass_1/widgets/home_current_card.dart';
// ignore: unused_import
import 'package:time_pass_1/module/home_current_event_card_data.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String img1 = "81660.jpg";
  List _rowdata =  [];
  bool is_data_loaded = false;

  Future _getdata() async {
    var responce = await http.get(Uri.parse("https://mpbca.000webhostapp.com/applicationUser/currentCard.php"));
    if(responce.statusCode == 200){
      setState(() {
        _rowdata = json.decode(responce.body) ;
      });
      return _rowdata;
    }
    else{
          Fluttertoast.showToast(
        msg: "network error occure",
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
    // TODO: implement initState
    super.initState();
    _getdata();
  }
  bool bcimgcheck = false;
  // @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          elevation: 0,
          title: Text("phonix"),
          actions: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("in progress"),
                ));
              },
              icon: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.grey[400],

            // indicator: (
            //   color: Colors.amber,
            // ),

            tabs: [
              Tab(
                child: Text(
                  "Today",
                ),
              ),
              Tab(
                child: Text(
                  "Upcoming",
                ),
              ),
              Tab(
                child: Text(
                  "Ended",
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),


              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _rowdata.map((crl) {
                  return GestureDetector(
                    // if (crl['image'] == null) {
                    //    setstate((){
                    //       bcimage = true;
                    //     }) 
                    // }
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CurrentDetailPage(
                            id: crl['event_ID'],
                            head: crl['title'],
                            location: crl['city'],
                            date: crl['event_date'],
                            bcimag:  'https://mpbca.000webhostapp.com/addon/event_form_images/IMG_0083.JPG',
                            prize: crl['price_amount'] == null ?"FREE" : crl['price'],
                            bookedpeople: crl['max_p'],
                            totalpeople: crl['max_p'],
                            organization: crl['organizer'],
                          ),
                        ));
                      },
                      child: CurrentEventCard(
                        head: crl['title'],
                        location: crl['city'],
                        date: DateTime.now(),
                        bcimag : 'https://mpbca.000webhostapp.com/addon/event_form_images/IMG_0083.JPG',  
                      ));
                }).toList(),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  children: [Text("in process")],
                ),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  children: [Text("in process")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
