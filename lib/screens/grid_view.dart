import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
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
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          padding: EdgeInsets.all(10),
          children: createGallery(50),
        ));
  }

  List<Widget> createGallery(int numImages) {
    int i = 0;
    List<Widget> images = List<Widget>();
    List<String> urls = List<String>();
    urls.add('https://bit.ly/gv_car_1');
    urls.add('https://bit.ly/gv_car_2');
    urls.add('https://bit.ly/gv_car_3');
    urls.add('https://bit.ly/gv_car_4');
    urls.add('https://bit.ly/gv_car_5');
    Widget image;
    while (i < numImages) {
      image = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(urls[i % 5]),
          ),
        ),
      );
      images.add(image);
      i++;
    }
    return images;
  }
}

class Contact {
  String name;
  String subTitle;
  IconData icon;
  Contact(this.name, this.subTitle, this.icon);
}
