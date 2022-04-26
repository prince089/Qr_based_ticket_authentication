import 'package:flutter/material.dart';

class GetProfiledata extends StatefulWidget {
  const GetProfiledata({Key? key}) : super(key: key);

  @override
  State<GetProfiledata> createState() => _GetProfiledataState();
}

class _GetProfiledataState extends State<GetProfiledata> {
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Text("PROFILE PAGE"),
          ),
          TextFormField(
            controller: fname,
            decoration: InputDecoration(labelText: "First Name"),
          ),
          TextFormField(
            controller: mname,
            decoration: InputDecoration(
              labelText: "Middle Name",
            ),
          ),
          TextFormField(
            controller: lname,
            decoration: InputDecoration(
              labelText: "Last Name",
            ),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
          ),

          ElevatedButton(onPressed: (){}, child: Text("GO Ahed"))
        ],
      )),
    );
  }
}
