import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#000000"),
        title: Text("BizCard"),
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Divider(
              thickness: 1,
              color: HexColor("#2C2C2E"),
              indent: 12,
              endIndent: 12,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[_getCard(), _getImg()],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 34.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Text(" VG", style: TextStyle(fontSize: 21, color: Colors.white))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                Text(" vishvesh.m.g@gmail.com",
                    style: TextStyle(fontSize: 21, color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                Text(
                  " +91-9687619224",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                Text(
                  " Surat, Gujarat",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _getImg() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
          image: new DecorationImage(
              image: new AssetImage("assets/final dp.jpeg"),
              fit: BoxFit.cover)),
    );
  }
}
