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
    Quote(author: 'Zakes', text: 'Sleep, wake up, eat, code.'),
    Quote(author: 'Taz', text: 'Stay safe, stay at home at all times'),
    Quote(author: 'Mania', text: 'Never settle for less.'),
    Quote(author: 'El Tazzo', text: 'Keep dreaming.'),
  ];

  Widget quoteListTemplate(quote){
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
                quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        )
      ),
    );
  }

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ] : quotes.map((quote) => quoteListTemplate(quote)).toList(),
      ),
    );
  }
}
