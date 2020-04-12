import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'coin_data.dart';
import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  @override
  Widget build(BuildContext context) {
    var cupertinoPicker = CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = currenciesList[index];
        });
      },
      itemExtent: 32,
      children: currenciesList.map((value) {
        return Text(value);
      }).toList(),
    );

    var dropdownButton = DropdownButton<String>(
      items: currenciesList.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
      value: selectedCurrency,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? cupertinoPicker : dropdownButton,
          ),
        ],
      ),
    );
  }
}
