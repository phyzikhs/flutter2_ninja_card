import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quote_list/quote.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: 'Sleep, wake up, eat, code.', author: 'Mania'),
    Quote(text: 'Stay safe, stay at home at all times', author: 'President'),
    Quote(text: 'Never settle for less.', author: 'Mido'),
    Quote(text: 'Keep dreaming.', author: 'Swiper'),
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
            child: Text('${quote.text} - ${quote.author}'),
        )).toList(),
      ),
    );
  }
}
