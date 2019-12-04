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
      child: ListView(
        children: showContacts(),
      ),
    );
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

  List<Contact> buildContacts() {
    List<Contact> contacts = List<Contact>();
    contacts
        .add(Contact('Salah Ismail', 'The Matrix', Icons.sentiment_neutral));
    contacts.add(Contact('Ahmed Ali', 'The Matrix', Icons.sentiment_satisfied));
    contacts.add(
        Contact('Salma Ahmed', 'The Matrix', Icons.sentiment_dissatisfied));
    contacts
        .add(Contact('Marıem Mehmet', 'The Matrix', Icons.sentiment_neutral));
    contacts
        .add(Contact('Burhan Omer', 'The Matrix', Icons.sentiment_satisfied));
    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContacts();
    for (var i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }
    List<ListTile> list = List<ListTile>();
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subTitle),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.amber[600],
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ));
    });
    return list;
  }
}

class Contact {
  String name;
  String subTitle;
  IconData icon;
  Contact(this.name, this.subTitle, this.icon);
}
