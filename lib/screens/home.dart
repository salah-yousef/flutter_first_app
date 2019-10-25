import 'package:flutter/material.dart';

class FuelForm extends StatefulWidget {
  FuelForm({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _FuelFormState createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final _currencies = <String>['Dollars', 'Euro', 'Pounds', 'TRY'];
  final double _formDistance = 10.0;
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _sayHello(),
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.lightBlue, fontSize: 36.0),
            ),
            /*            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                items: _currencies.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: new Text(item),
                  );
                }).toList(),
                value: _currency,
                onChanged: (String item) {
                  setState(() {
                    this._currency = item;
                  });
                },
              ),
            ), */
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
              ),
              child: TextField(
                controller: distanceController,
                decoration: InputDecoration(
                    hintText: 'e.g. 124',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Distance'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
              ),
              child: TextField(
                controller: avgController,
                decoration: InputDecoration(
                    hintText: 'e.g. 17',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Distance Per Unit'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                    hintText: 'e.g. 1.24',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,
              onPressed: () {
                setState(() {
                  result = _calculate();
                });
              },
              child: Text(
                'Submit',
                textScaleFactor: 1.5,
              ),
            ),
            Text(result),
          ],
        ),
      ),
    );
  }

  String _sayHello() {
    String hello;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    if (hour < 12) {
      hello = 'Good Morning';
    } else if (hour < 18) {
      hello = 'Good Afternoon';
    } else {
      hello = 'Good Evening';
    }

    String minutes =
        (minute < 10) ? '0' + minute.toString() : minute.toString();
    return "it's now " + hour.toString() + ":" + minutes + "\n" + hello;
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _consumption = double.parse(avgController.text);
    double _fuelCost = double.parse(priceController.text);

    double _totalCost = _distance / _consumption * _fuelCost;
    return ('The total cost of your trip is: ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency);
  }
}
