import 'package:flutter/material.dart';

class FuelForm extends StatefulWidget {
  FuelForm({Key key, this.title}) : super(key: key);

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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Distance Per Unit'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          hintText: 'e.g. 1.24',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: _formDistance * 5,
                  ),
                  Expanded(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
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
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                      child: Text(
                        'Reset',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                ],
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

  void _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}
