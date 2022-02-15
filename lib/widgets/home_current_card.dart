import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentEventCard extends StatelessWidget {
  final String head;
  final DateTime date;
  final String location;
  final String bcimag;
  CurrentEventCard(
      {required this.head,
      required this.date,
      required this.location,
      required this.bcimag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
      child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 2,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstIn),
                  image: AssetImage("assets/main/$bcimag"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // SizedBox(height: 20,),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 60,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                DateFormat.d().format(date),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                DateFormat.MMM().format(date),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 15,
                    child: FittedBox(
                      child: Text(
                        "$head",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey[100],
                          size: 14,
                        ),
                        SizedBox(width: 2),
                        FittedBox(
                          child: Text(
                            "$location",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey[100],
                          size: 14,
                        ),
                        SizedBox(width: 2),
                        Text(
                          DateFormat.Hm().format(date),
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
    );
       
    
  }
}
