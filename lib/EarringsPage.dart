import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jewls/utils/cart_icons_icons.dart';
import 'sub_pages/home_list.dart';
import 'sub_pages/cart.dart';

class EarringsPage extends StatefulWidget {
  @override
  _EarringsPageState createState() => _EarringsPageState();
}

class _EarringsPageState extends State<EarringsPage> {
  List<Widget> widgetList = [
    HomeList(),
    CartPage(),
    HomeList(),
    HomeList(),
  ];

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.home,
              ),
              title: Text('   Store  ', style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.cart,
              ),
              title: Text('My Cart', style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.favourites,
              ),
              title: Text('Favourites', style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.account,
              ),
              title: Text(
                'My Account',
                style: TextStyle(),
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 10.0),
        decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.short_text,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () {
                        Navigator.pop(context, '/home');
                      },
                    ),
                  ),
                  Text(
                    'Earrings',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.tune,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              height: 580.0,
              child: Earrings(),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildBottomBar(BuildContext con) {
  return BottomNavigationBar(
    // selectedItemColor: Colors.green,
    // unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    currentIndex: 2,
    onTap: (index) {},
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.home,
            color: Colors.black,
          ),
          title: Text('   Store  ', style: TextStyle())),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.cart,
          ),
          title: Text('My Cart', style: TextStyle())),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.favourites,
          ),
          title: Text('Favourites', style: TextStyle())),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.account,
          ),
          title: Text(
            'My Account',
            style: TextStyle(),
          ))
    ],
  );
}

class Earrings extends StatefulWidget {
  @override
  _EarringsState createState() => _EarringsState();
}

class _EarringsState extends State<Earrings> {
  var itemList = [
    {
      "name": "A1",
      "image": "assets/1.jpg",
    },
    {"name": "A2", "image": "assets/1.jpg"},
    {
      "name": "A3",
      "image": "assets/1.jpg",
    },
    {
      "name": "A4",
      "image": "assets/1.jpg",
    },
    {
      "name": "A5",
      "image": "assets/1.jpg",
    },
    {
      "name": "A6",
      "image": "assets/1.jpg",
    },
    {
      "name": "A7",
      "image": "assets/1.jpg",
    },
    {
      "name": "A8",
      "image": "assets/1.jpg",
    },
    {
      "name": "A9",
      "image": "assets/1.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleItem(
            itemimage: itemList[index]['image'],
            itemprice: itemList[index]['name'],
          );
        });
  }
}

class SingleItem extends StatelessWidget {
  final itemimage;
  final itemprice;

  SingleItem({
    this.itemimage,
    this.itemprice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 15,
          )
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 95,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                child: Image.asset(
                  itemimage,
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 5),
                    blurRadius: 15,
                  )
                ],
              ),
            ),
            Text(
              itemprice,
              textAlign: TextAlign.center,
            ),
          ]),
    );
  }
}
