import 'package:flutter/material.dart';
import 'package:jewls/utils/cart_icons_icons.dart';
import 'homePageBody.dart';
//import 'sub_pages/home_list.dart';
//import 'homePageBody.dart';
//import 'sub_pages/cart.dart';

const TextStyle kBottomBarTextStyle = TextStyle(fontFamily: 'PlayfairDisplay');

class HomePage extends StatefulWidget {
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
//    HomeList(),
//    CartPage(),
//    HomeList(),
//    HomeList(),
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
                  style: TextStyle(fontFamily: 'PlayfairDisplay'))),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.account,
              ),
              title: Text('My Account', style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.favourites,
              ),
              title: Text('Favourites', style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.cart,
              ),
              title: Text('My Cart', style: TextStyle())),
        ],
      ),
//      body: HomePageBody(),
      body: _widgetList[_index],
    );
  }
}

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

Widget buildBottomBar(BuildContext con) {
  return BottomNavigationBar(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    currentIndex: 2,
    onTap: (index) {},
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.home,
            color: Colors.black,
          ),
          title: Text('   Store  ', style: kBottomBarTextStyle)),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.cart,
          ),
          title: Text('My Cart', style: kBottomBarTextStyle)),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.favourites,
          ),
          title: Text('Favourites', style: kBottomBarTextStyle)),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.account,
          ),
          title: Text('My Account', style: kBottomBarTextStyle))
    ],
  );
}
