//import 'package:flutter/foundation.dart';



class CurrentEventCardData{
  final String head;
  final String date;
  final String location;
  final String bcimag;
  final String prize;
  final int totalpeople;
  final int bookedpeople;
  final String organization;

  CurrentEventCardData({
    required this.head,
    required this.date,
    required this.location,
    required this.bcimag,
    required this.prize,
    required this.bookedpeople,
    required this.totalpeople,
    required this.organization,
  });
}
