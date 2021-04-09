import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipApp extends StatefulWidget {
  @override
  _TipAppState createState() => _TipAppState();
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

class _TipAppState extends State<TipApp> {
  int _tipPercentage = 0;
  int _personCount = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Tip App"), backgroundColor: HexColor("#000000")),
        body: Container(
          // margin:
          //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
          // alignment: Alignment.center,
          color: Colors.black,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              Divider(
                  thickness: 1,
                  color: HexColor("#2C2C2E"),
                  indent: 12,
                  endIndent: 12),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [HexColor('#cf5757'), HexColor('#cfa157')]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Per Person",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              "\$ ${calculateTotalPerPerson(calculateTotalTip(_billAmount, _personCount, _tipPercentage), _billAmount, _personCount)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                //width: 250,
                //height: 250,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          prefixText: "Bill Amount: \$",
                          prefixStyle:
                              TextStyle(color: Colors.grey, fontSize: 17),
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.grey,
                          )),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (exception) {
                          _billAmount = 0.0;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Split",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCount > 1) {
                                    _personCount -= 1;
                                  } else {
                                    //
                                  }
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("#2C2C2E"),
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#aaaaaa")),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "$_personCount",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCount > 0) {
                                    _personCount += 1;
                                  } else {
                                    //
                                  }
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor("#2C2C2E"),
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#aaaaaa")),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tip",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$${(calculateTotalTip(_billAmount, _personCount, _tipPercentage)).toStringAsFixed(2)}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                    Column(
                      children: [
                        Text("$_tipPercentage%",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Slider(
                            min: 0,
                            max: 100,
                            activeColor: Colors.grey.shade700,
                            inactiveColor: Colors.grey,
                            divisions: 10,
                            value: _tipPercentage.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                _tipPercentage = value.round();
                              });
                            })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  calculateTotalPerPerson(double totalTip, double billAmount, int splitBy) {
    var totalPerPerson = (totalTip + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int split, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = billAmount * tipPercentage / 100;
    }
    return totalTip;
  }
}
