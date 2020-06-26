import 'package:flutter/material.dart';
import 'package:jewls/utils/cart_icons_icons.dart';
import 'package:jewls/utils/constants.dart';
import 'homePageBody.dart';

import 'sub_pages/cart.dart';

const TextStyle kBottomBarTextStyle = TextStyle(fontFamily: 'PlayfairDisplay');


class HomePage extends StatefulWidget {
  static const String id = '/HomePage';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    HomePageBody(),
    HomePageBody(),
    HomePageBody(),
    HomePageBody(),

  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff7E3338),
        unselectedItemColor: Color(0xff7E3338),
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
                Icons.home,
              ),

              title: Text('Home',
                  style: TextStyle(fontFamily: 'PlayfairDisplay')),
          ),

          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.account,
              ),
              title: Text('My Account', style: kBottomBarTextStyle)),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.favourites,
              ),
              title: Text('Favourites', style: kBottomBarTextStyle)),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.cart,
              ),

              title: Text('My Cart', style: kBottomBarTextStyle)),

        ],
      ),
      body: _widgetList[_index],
    );
  }
}

//Not needed
Widget _buildAppBar() {
  return AppBar(
    centerTitle: true,
    brightness: Brightness.dark,
    elevation: 0,
    backgroundColor: Colors.green,
    automaticallyImplyLeading: false,
    title: Text(
      'Jewls',
      style: TextStyle(color: Colors.white),
    ),
    actions: <Widget>[
      Icon(Icons.search, color: Colors.white),
      SizedBox(
        width: 10,
      ),
      Icon(Icons.notifications_none, color: Colors.white),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
