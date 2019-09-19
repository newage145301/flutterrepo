import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton<String> getAndroidPicker() {
    List<DropdownMenuItem<String>> items = new List<DropdownMenuItem<String>>();
    for (var i = 0; i < currenciesList.length; i++) {
      var item = currenciesList[i];
      DropdownMenuItem x =
          DropdownMenuItem<String>(child: Text(item), value: item);
      items.add(x);
    }

    return DropdownButton<String>(

      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String newValue) {

        var doviz= DovizEnum.values.firstWhere((e)=>e.toString()=='DovizEnum.'+newValue);
        var exc= Calculate().exchange(doviz).toString();
        setState(() {
          exchangeValue='$exc TL';
          dropdownValue = newValue;
          print(newValue);
        });


      },
      items: items,
    );
  }

  CupertinoPicker getIOSPicker() {
    List<Text> items = new List<Text>();
    for (var currency in currenciesList) {
      Text text = Text(currency);
      items.add(text);
    }
    ;
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selected) {
        print(selected);
      },
      children: items,
    );
  }

  String dropdownValue = 'USD';
  String exchangeValue='0 TL';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Döviz/ Kıymetli Maden - TL'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 128.0),
                    child: Text(
                      exchangeValue,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 128.0),
                    child: Text(
                      exchangeValue,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Center(
              child: Platform.isAndroid ? getAndroidPicker() : getIOSPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
