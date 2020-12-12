import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/Africa/Johannesburg'); //http://worldtimeapi.org/api/timezone/Europe/Paris
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0,3);

    // print(datetime);
    // print(offset);
    // print(data); // datetime: 2020-12-12T01:18:47.506709+01:00 // utc_offset: +02:00

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add( Duration(hours: int.parse(offset)) );
    print(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen...'),
    );
  }
}
