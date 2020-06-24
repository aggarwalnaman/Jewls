import 'package:flutter/material.dart';
import 'package:jewls/detailsPage.dart';
import 'package:jewls/filterPage.dart';
import 'package:jewls/utils/cart_icons_icons.dart';
import 'package:jewls/utils/constants.dart';
import 'homePageBody.dart';

class EarringsPage extends StatefulWidget {
  static const String id = '/EarringsPage';

  @override
  _EarringsPageState createState() => _EarringsPageState();
}

class _EarringsPageState extends State<EarringsPage> {
  List<Widget> widgetList = [
    HomePageBody(),
    HomePageBody(),
    HomePageBody(),
    HomePageBody(),
  ];

  List itemList = [
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring2.png'},
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring3.png'},
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring4.png'},
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring5.png'},
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring6.png'},
    {'name': '₹7500', 'image': 'assets/images/listearrings/earring7.png'},
  ];

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: Text('Home', style: kBottomBarTextStyle)),
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kSearchPageCardColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(27.0),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: kInactiveSearchPageTextColor,
                        ),
                        onPressed: () {
                          //TODO: implement search functionality
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: kInactiveSearchPageTextColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              'Earrings',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 31.0,
                                color: Color(0xff021D3A),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.tune,
                            size: 30,
                            color: kInactiveSearchPageTextColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, FilterPage.id);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Container(
                      height: 580.0,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 140 / 160,
                        ),
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleItem(
                            itemImage: itemList[index]['image'],
                            itemPrice: itemList[index]['name'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleItem extends StatefulWidget {
  final itemImage;
  final itemPrice;

  SingleItem({this.itemImage, this.itemPrice});

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  IconData icon = Icons.favorite_border;

  //_isClicked monitors when the heart icon is clicked
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.id);
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(21.0)),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  icon,
                  size: 20.0,
                ),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    _isClicked = !_isClicked;
                    icon = _isClicked ? Icons.favorite : Icons.favorite_border;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: 92.0,
                height: 92.0,
                child: Image.asset(
                  widget.itemImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.itemPrice,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.0,
                fontFamily: 'PlayfairDisplay',
                color: kInactiveSearchPageTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
