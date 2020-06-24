import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jewls/EarringsPage.dart';
import 'package:jewls/utils/constants.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  List<bool> isSelected;
  List<String> getNames = [];

  int getDiscoverListNames() {
    getNames = [
      'New In',
      'Bestsellers',
      'Earrings',
      'Rings',
      'Necklaces',
    ];

    return getNames.length;
  }

  List<ListViewOverlapContainer> _buildList() {
    List<ListViewOverlapContainer> _list = [];

    List itemList = [
      {'image': 'assets/images/homescreen/1.png', 'text': '₹8000'},
      {'image': 'assets/images/homescreen/2.png', 'text': '₹10,000'},
      {'image': 'assets/images/homescreen/7.png', 'text': '₹4000'},
    ];

    for (int index = 0; index < itemList.length; index++) {
      var item = ListViewOverlapContainer(
        image: itemList[index]['image'],
        text: itemList[index]['text'],
        onPressed: () {},
      );

      _list.add(item);
    }

    return _list;
  }

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(getDiscoverListNames(), (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kSearchPageCardColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(27.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.short_text,
                      size: 30,
                      color: Color(0xff707070),
                    ),
                    onPressed: () {
                      //TODO: implement drawer functionality
                    },
                  ),
                  Text(
                    'Jewls',
                    style: TextStyle(
                      fontSize: 31.0,
                      color: Color(0xffB7938A),
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xff707070),
                    ),
                    onPressed: () {
                      //TODO: implement search functionality
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 31.0,
                    color: kInactiveSearchPageTextColor,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 30.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getNames.asMap().entries.map((entry) {
                    return DiscoverListViewItems(
                      name: entry.value,
                      isSelected: isSelected[entry.key],
                      onTap: () {
                        setState(() {
                          isSelected[entry.key] = !isSelected[entry.key];
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 225.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _buildList(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, EarringsPage.id);
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                          color: kActiveSearchPageButtonColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 2.0,
                      width: 17.0,
                      padding: EdgeInsets.only(top: 5.0),
                      decoration: BoxDecoration(
                        color: kActiveSearchPageButtonColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewOverlapContainer extends StatelessWidget {
  final String text;
  final String image;
  final Function onPressed;

  ListViewOverlapContainer(
      {@required this.image, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.0,
      height: 80.0,
      margin: EdgeInsets.only(right: 5.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 110.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 20.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'PlayfairDisplay',
                      color: kInactiveSearchPageTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              image,
              width: 110,
              height: 110,
            ),
          ),
          Positioned(
            top: 162,
            left: 90,
            child: Container(
              width: 41.0,
              height: 41.0,
              child: RawMaterialButton(
                fillColor: Colors.white,
                shape: CircleBorder(),
                elevation: 12.0,
                child: Icon(
                  Icons.add,
                  color: kActiveSearchPageButtonColor,
                ),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoverListViewItems extends StatefulWidget {
  final bool isSelected;
  final String name;

  /// OnPressed is passed from the parent. This can be changed to handle it using any state management.
  final Function onTap;

  DiscoverListViewItems(
      {@required this.name, @required this.isSelected, @required this.onTap});

  @override
  _DiscoverListViewItemsState createState() => _DiscoverListViewItemsState();
}

class _DiscoverListViewItemsState extends State<DiscoverListViewItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 19.0,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
                color: widget.isSelected
                    ? kActiveSearchPageButtonColor
                    : kInactiveSearchPageTextColor,
              ),
            ),
            Visibility(
              visible: widget.isSelected,
              child: AnimatedContainer(
                duration: Duration(seconds: 5),
                child: Container(
                  height: 2.0,
                  width: 25.0,
                  padding: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: kActiveSearchPageButtonColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
