import 'package:flutter/material.dart';
import 'package:time_pass_1/widgets/current_event_detail_page.dart';
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
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 20,
      organization: "charusat"
    ),
    CurrentEventCardData(
      head: "Event 2",
      date: DateTime.now(),
      location: "Location 2",
      bcimag: "Flag-India.jpg",
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 50,
      organization: "charusat"
    ),
    CurrentEventCardData(
      head: "Event 3",
      date: DateTime.now(),
      location: "Location 3",
      bcimag: "Flag-India.jpg",
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 10,
      organization: "MSU"
    ),
    CurrentEventCardData(
      head: "Event 4",
      date: DateTime.now(),
      location: "Location 4",
      bcimag: "81660.jpg",
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 20,
      organization: "ddu"
    ),
    CurrentEventCardData(
      head: "Event 5",
      date: DateTime.now(),
      location: "Location 5",
      bcimag: "Flag-India.jpg",
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 35,
      organization: "charusat"
    ),
    CurrentEventCardData(
      head: "Event 6",
      date: DateTime.now(),
      location: "Location 6",
      bcimag: "Flag-India.jpg",
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 20,
      organization: "viswa"
    ),
    CurrentEventCardData(
      head: "Event 7",
      date: DateTime.now(),
      location: "Location 7",
      bcimag: "Flag-India.jpg",
      prize: 0.0,
      totalpeople: 50,
      bookedpeople: 49,
      organization: "aryan"
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
                children: currenteventlist.map((crl) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CurrentDetailPage(
                            head: crl.head,
                            location: crl.location,
                            date: crl.date,
                            bcimag: crl.bcimag,
                            prize:crl.prize,
                            bookedpeople: crl.bookedpeople,
                            totalpeople: crl.totalpeople,
                            organization: crl.organization,
                          ),
                        ));
                      },
                      child: CurrentEventCard(
                        head: crl.head,
                        location: crl.location,
                        date: crl.date,
                        bcimag: crl.bcimag,
                      ));
                }).toList(),
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
