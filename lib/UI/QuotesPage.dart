import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _QuotesPageState extends State<QuotesPage> {
  int _index = 0;

  List quotes = [
    '“The purpose of our lives is to be happy.” — Dalai Lama',
    '“Life is what happens when you’re busy making other plans.” — John Lennon',
    '“Get busy living or get busy dying.” — Stephen King',
    '“You only live once, but if you do it right, once is enough.” — Mae West',
    '“Many of life’s failures are people who did not realize how close they were to success when they gave up.”– Thomas A. Edison',
    '“If you want to live a happy life, tie it to a goal, not to people or things.”– Albert Einstein',
    '“Never let the fear of striking out keep you from playing the game.”– Babe Ruth',
    '“Money and success don’t change people; they merely amplify what is already there.” — Will Smith',
    '“Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking.” – Steve Jobs'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#000000"),
        title: Text(
          "Quotes Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              thickness: 1,
              color: HexColor("#2C2C2E"),
              indent: 12,
              endIndent: 12,
            ),
            Expanded(
              child: Center(
                child: Container(
                    height: 200,
                    width: 350,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [HexColor('#7c48ab'), HexColor('#5773cf')]),
                      borderRadius: BorderRadius.circular(14.5),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Center(
                          child: Text(
                        quotes[_index],
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 18),
                      )),
                    )),
              ),
            ),
            Divider(thickness: 3),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Container(
                  height: 65,
                  width: 220,
                  child: FlatButton.icon(
                      color: HexColor("#2C2C2E"),
                      onPressed: _showQuote,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(17.0)),
                      icon: Icon(
                        Icons.wb_incandescent,
                        color: HexColor("#FF453A"),
                      ),
                      label: Text(
                        "New Quote",
                        style:
                            TextStyle(fontSize: 21, color: HexColor("#FF453A")),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
      _index = _index % quotes.length;
    });
  }
}
