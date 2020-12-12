import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // url location for API endpoint, e.g. Africa/Johannesburg
  bool isDayTime; // current time is day time or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url'); //http://worldtimeapi.org/api/timezone/Europe/Paris
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

      // set if it's day time or night time
      isDayTime = (now.hour > 6 && now.hour < 20) ? true: false;

      // set time property
      time = DateFormat.jm().format(now);
    } catch(e){
      print('an error occurred: $e');
      time = (time!=null) ? time : 'Could not get time data';
      isDayTime = (isDayTime!=null) ? isDayTime : true;
    }

  }
}