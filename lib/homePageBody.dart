import 'package:flutter/material.dart';
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
                  Icon(
                    Icons.short_text,
                    size: 30,
                    color: Color(0xff707070),
                  ),
                  Text('Jewls',
                      style: TextStyle(
                        fontSize: 31.0,
                        color: Color(0xffB7938A),
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                      )),
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xff707070),
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
                height: 25.0,
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
            ],
          ),
        ),
      ),
    );
  }
}

class DiscoverListViewItems extends StatelessWidget {
  final bool isSelected;
  final String name;

  /// OnPressed is passed from the parent. This can be changed to handle it using any state management.
  final Function onTap;

  DiscoverListViewItems(
      {@required this.name, @required this.isSelected, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 19.0,
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.bold,
            color: isSelected
                ? kActiveSearchPageButtonColor
                : kInactiveSearchPageTextColor,
          ),
        ),
      ),
    );
  }
}
