import 'dart:io';

import 'package:bitcoin_ticker/coin_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<String> listPrice = ['?', '?', '?'];
  void updateUI() async {
    for (var i = 0; i < cryptoList.length; i++) {
      print('object0');
      listPrice[i] = '?';
      CoinBrain().getPrice(cryptoList[i], selectedCurrency).then((onValue) {
        setState(() {
          listPrice[i] = onValue;
          print(listPrice[i]);
        });
      });
      print('a');
    }
  }

  @override
  void initState() {
    updateUI();
    super.initState();
  }

  List<Widget> getListConverter() {
    List<Widget> listConverter = [];
    for (var i = 0; i < cryptoList.length; i++) {
      listConverter.add(Converter(
          price: listPrice[i],
          crypto: cryptoList[i],
          selectedCurrency: selectedCurrency));
    }
    return listConverter;
  }

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
        updateUI();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getListConverter(),
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

class Converter extends StatelessWidget {
  const Converter({
    Key key,
    @required this.price,
    @required this.crypto,
    @required this.selectedCurrency,
  }) : super(key: key);

  final String price;
  final String crypto;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 $crypto = $price $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
