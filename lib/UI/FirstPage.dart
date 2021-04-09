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

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => debugPrint("Email"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#FF453A"),
        child: Icon(Icons.assessment),
        onPressed: () => debugPrint('Floating Button'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios_outlined,
                  color: HexColor("#8E8E93")),
              title: Text('Back',
                  style: TextStyle(color: HexColor("#8E8E93"), fontSize: 12))),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios_outlined,
                  color: HexColor("#8E8E93")),
              title: Text('Next',
                  style: TextStyle(color: HexColor("#8E8E93"), fontSize: 12))),
        ],
        onTap: (int index) {
          debugPrint("Bottom Navigation Button - Index = $index");
        },
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(
              thickness: 1,
              color: HexColor("#2C2C2E"),
              indent: 12,
              endIndent: 12,
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter, child: CustomButton()),
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
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            'Tapped!',
            style: TextStyle(fontSize: 18),
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
          height: 70,
          width: 150,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: HexColor("#2C2C2E"),
            borderRadius: BorderRadius.circular(14.0),
          ),
          alignment: Alignment.center,
          child: Text(
            "Tap me!",
            style: TextStyle(fontSize: 26, color: HexColor("#E5E5EA")),
          )),
    );
  }
}
