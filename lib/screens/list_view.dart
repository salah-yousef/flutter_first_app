import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
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
      child: ListView.separated(
        itemCount: 25,
        itemBuilder: (context, index) => createSquare(index),
        separatorBuilder: (context, index) => createSeparator(index),
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
  while (i < numSquares) {
    Container square = Container(
      color: colors[i % 5],
      width: 100,
      height: 100,
      child: Text(i.toString()),
    );
    i++;
    squares.add(square);
  }

  return squares;
}

Widget createSquare(int position) {
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  Container square = Container(
    color: colors[position % 5],
    width: 100,
    height: 100,
    child: Text(position.toString()),
  );

  return square;
}

Widget createSeparator(int position) {
  Widget separator = Container(height: 15);
  return separator;
}
