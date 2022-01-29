import 'package:flutter/material.dart';
import 'package:time_pass_1/home_current_card.dart';
import 'package:time_pass_1/home_current_event_card_data.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          elevation: 0,
          title: Text("phonix"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey[400],
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
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: currenteventlist.map((crl) {
                    return CurrentEventCard();
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
