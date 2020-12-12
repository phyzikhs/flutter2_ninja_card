import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  BuildContext theCallerContext;

  Loading(BuildContext context){
    this.theCallerContext = context;
  }

  @override
  _LoadingState createState() => _LoadingState(theCallerContext);
}

class _LoadingState extends State<Loading> {
  BuildContext theCallerContext;

  _LoadingState(BuildContext theCallerContext){
    this.theCallerContext = theCallerContext;
  }



  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Johannesburg', flag: 'rsa.png', url: 'Africa/Johannesburg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  void updateTime(instance) async {
    WorldTime ofInstance = WorldTime(
        location: instance['location'],
      flag: instance['flag'],
      url: instance['url'],
    );
    await ofInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
          'location': ofInstance.location,
          'flag': ofInstance.flag,
          'time': ofInstance.time,
          'isDayTime': ofInstance.isDayTime,
        }
    );
  }

  @override
  void initState() {
    super.initState();

    //check context that called this state
    dynamic instance = ModalRoute.of(theCallerContext).settings.arguments;
    if(instance == null) setupWorldTime();
    else {
      print('Loading: Searching time for $instance');
      updateTime(instance);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
