import 'package:flutter/material.dart';

class CurrentEventCard extends StatelessWidget {
  const CurrentEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 2,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstIn),
              image: AssetImage("assets/main/81660.jpg"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
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
                            height: 7,
                          ),
                          Text(
                            "21",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "Dec",
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
                child: Text(
                  "Event Name Event ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
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
                    Text(
                      "vanue",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[100],
                      ),
                    ),
                    Text(
                      "Place 1",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[100],
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
                      "20:00",
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
        SizedBox(height: 15,)
      ],
    );
  }
}
