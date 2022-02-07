import 'package:flutter/material.dart';
import 'package:time_pass_1/widgets/home_current_card.dart';
import 'package:time_pass_1/module/home_current_event_card_data.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  // String img1 = "81660.jpg";
  // String img2 = "Flag-India.jpg";
  final List<CurrentEventCardData> currenteventlist = [
    CurrentEventCardData(
      head: "Event 1",
      date: DateTime.now(),
      location: "Location 1",
      bcimag: "81660.jpg",
    ),
    CurrentEventCardData(
      head: "Event 2",
      date: DateTime.now(),
      location: "Location 2",
      bcimag: "Flag-India.jpg",
    ),
    CurrentEventCardData(
      head: "Event 3",
      date: DateTime.now(),
      location: "Location 3",
      bcimag: "Flag-India.jpg",
    ),
    CurrentEventCardData(
      head: "Event 4",
      date: DateTime.now(),
      location: "Location 4",
      bcimag: "81660.jpg",
    ),
    CurrentEventCardData(
      head: "Event 5",
      date: DateTime.now(),
      location: "Location 5",
      bcimag: "Flag-India.jpg",
    ),
    CurrentEventCardData(
      head: "Event 6",
      date: DateTime.now(),
      location: "Location 6",
      bcimag: "Flag-India.jpg",
    ),
    CurrentEventCardData(
      head: "Event 7",
      date: DateTime.now(),
      location: "Location 7",
      bcimag: "Flag-India.jpg",
    ),
  ];
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
              onPressed: () {},
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
                  "Current",
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
            Padding(
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  
                  children: currenteventlist.map((crl) {
                    
                    return CurrentEventCard(head:crl.head,location:crl.location,date: crl.date,bcimag: crl.bcimag,);
                  }).toList(),
                ),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  children: [Text("hello2")],
                ),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  children: [Text("hello3")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
