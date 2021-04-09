import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:page_transition/page_transition.dart';
import 'package:try1/UI/BizCard.dart';
import 'package:try1/UI/QuotesPage.dart';
import 'FirstPage.dart';
import 'TipApp.dart';

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: HexColor("#000000"),
      //   //centerTitle: true,
      //   title: Text("Welcome to my first app!"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.info_outline, color: HexColor("#E5E5EA")),
      //       onPressed: () => Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => BizCard()),
      //       ),
      //     ),
      //   ],
      // ),

      body: Container(
          //alignment: Alignment.center,
          color: Colors.black,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text("My First App!",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 35)),
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.info_outline, color: HexColor("#8E8E93")),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BizCard()),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: HexColor("#2C2C2E"),
                indent: 12,
                endIndent: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 175.0),
                child: FirstPageButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: QuotesPageButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TipAppButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: BizCardButton(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    thickness: 1,
                    color: HexColor("#2C2C2E"),
                    indent: 12,
                    endIndent: 12,
                  ),
                ),
              ),
            ],
          )),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor("#000000"),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: HexColor("#8E8E93")),
              title: Text(
                "Home Page",
                style: TextStyle(color: HexColor("#8E8E93"), fontSize: 12),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_quote, color: HexColor("#8E8E93")),
              title: Text(
                "Quotes Page",
                style: TextStyle(color: HexColor("#8E8E93"), fontSize: 14),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                color: HexColor("#8E8E93"),
              ),
              title: Text(
                'Tip App',
                style: TextStyle(color: HexColor("#8E8E93"), fontSize: 14),
              )),
        ],
        selectedItemColor: HexColor("#FF453A"),
        onTap: (int index) {
          switch (index) {
            case 0:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              }
              break;
            case 1:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotesPage()),
                );
              }
              break;
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TipApp()),
                );
              }
              break;
          }
        },
      ),
    );
  }
}

class FirstPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            'Navigating to basic Home Page',
            style: TextStyle(fontSize: 15),
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
          );
          Scaffold.of(context).hideCurrentSnackBar();
        });
      },
      child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: HexColor("#2C2C2E"),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            "First Home Page UI",
            style: TextStyle(fontSize: 23, color: HexColor("#E5E5EA")),
          )),
    );
  }
}

class QuotesPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            'Navigating to Quotes Page',
            style: TextStyle(fontSize: 15),
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuotesPage()),
          );
          Scaffold.of(context).hideCurrentSnackBar();
        });
      },
      child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: HexColor("#2C2C2E"),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            "Quotes Page",
            style: TextStyle(fontSize: 23, color: HexColor("#E5E5EA")),
          )),
    );
  }
}

class TipAppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            'Navigating to Tip App',
            style: TextStyle(fontSize: 15),
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TipApp()),
          );
          Scaffold.of(context).hideCurrentSnackBar();
        });
      },
      child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: HexColor("#2C2C2E"),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            "Tip Calculator",
            style: TextStyle(fontSize: 23, color: HexColor("#E5E5EA")),
          )),
    );
  }
}

class BizCardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            'Navigating to Biz Card',
            style: TextStyle(fontSize: 15),
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BizCard()),
          );
          Scaffold.of(context).hideCurrentSnackBar();
        });
      },
      child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: HexColor("#2C2C2E"),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            "About Me",
            style: TextStyle(fontSize: 23, color: HexColor("#E5E5EA")),
          )),
    );
  }
}
