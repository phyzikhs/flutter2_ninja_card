import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;


  void getData() async {
    // simulate network request for user name
    String username = await Future.delayed(Duration(seconds: 3), (){
      return 'zakes';
    });

    // simulate network request for bio of the user name
    String bio = await Future.delayed(Duration(seconds: 2), (){
      return 'Vegetarian, Musician & Bee hunter';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('Hello there');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text('Counter is ${counter}'),
      ),
    );
  }
}
