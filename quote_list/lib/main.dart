import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<String> quotes = [
    'Sleep, wake up, eat, code.',
    'Stay safe, stay at home at all times',
    'Never settle for less.',
    'Keep dreaming.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (quotes==null || quotes.length==0) ? [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Text(
            'NO QUOTES',
            style: TextStyle(
              color: Colors.cyanAccent,
              backgroundColor: Colors.pinkAccent,
            ),
          ),
        ),
        ] : quotes.map((quote) => Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Text(quote),
        )).toList(),
      ),
    );
  }
}
