import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
          backgroundColor: Colors.orange[800],
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Stack(
        children: showPizzaLayout(sizeX, sizeY),
      ),
    );
  }
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = List<Widget>();
  //squares.add(Container(color: Colors.black,));
  Widget square;
  while (i < numSquares) {
    square = Positioned(
        top: 100 + i.toDouble() * 100,
        left: 25 + i.toDouble() * 25,
        child: Container(
          color: colors[i],
          width: 60 * (numSquares.toDouble() - i),
          height: 60 * (numSquares.toDouble() - i),
          child: Text(i.toString()),
        ));
    i++;
    squares.add(square);
  }

  return squares;
}

List<Widget> showPizzaLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildern = List<Widget>();
  Container backGround = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage('https://bitly.com/pizzaimage'),
          fit: BoxFit.fitHeight),
    ),
  );
  layoutChildern.add(backGround);
  Positioned pizzaCard = Positioned(
    top: sizeY / 10,
    left: sizeX / 35,
    child: Card(
      elevation: 12,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          Text(
            'Pizza Margherita',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange[800]),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'This delicious pizza is made of tomato,\n Mozzarella and Basil. \n\n Seriously you can\'t miss it.',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
          )
        ],
      ),
    ),
  );

  Positioned orderButton = Positioned(
    bottom: sizeY / 20,
    left: sizeX / 20,
    width: sizeX - sizeX / 10,
    child: RaisedButton(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.orange[900],
      child: Text(
        'Order Now!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {},
    ),
  );
  layoutChildern.add(orderButton);
  layoutChildern.add(pizzaCard);
  return layoutChildern;
}
