import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewls/utils/constants.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List itemList = [
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},
    {'name': 'Circle Miracle Plate Studs Earrings','code':'SKU: J2KFI7FHGKGG80','price': '₹7500', 'image': 'assets/images/listearrings/earring1.png'},

  ];

  @override
  Widget build(BuildContext context) {

    Widget iconBuild(String image, String text1,String text2 ){
      return Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
           children: <Widget>[
            Image.asset(image),
            Text(text1,style: TextStyle(fontFamily: 'PlayfairDisplay', color: Color(0xFF7E3338))),
            Text(text2,style: TextStyle(fontFamily: 'PlayfairDisplay', color: Color(0xFF7E3338))),
         ],
        ),
      );
    }
    Widget iconBuildStack(String image, String text1,String text2 ){
      return Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
             Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                      Image.asset('assets/images/cartimages/Layer 9.png'),
                      Image.asset(image),
                  ],
                ),
            Text(text1,style: TextStyle(fontFamily: 'PlayfairDisplay', color: Color(0xFF7E3338))),
            Text(text2,style: TextStyle(fontFamily: 'PlayfairDisplay', color: Color(0xFF7E3338))),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(27.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: kInactiveSearchPageTextColor,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                            ),
                            Text(
                              'Cart',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 31.0,
                                color: Color(0xff021D3A),
                              ),
                            ),
                      ],
                    ),
                    Container(
                        height: 32.0,
                        color: Colors.blueGrey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26.0),
                                child: Text(
                                  'Items(0)',
//                              textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'PlayfairDisplay',
                                      color: Colors.black
                                  ),
                                ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                '₹7500',
//                              textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'PlayfairDisplay',
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 550.0,
//                      child: Column(
//                        children: <Widget>[
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: itemList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SingleItem(
                                itemImage: itemList[index]['image'],
                                itemPrice: itemList[index]['price'],
                                itemName: itemList[index]['name'],
                                itemCode: itemList[index]['code'],
                              );
                            },
                          ),
//                          Container(
//                            width: double.infinity,
//                            decoration: BoxDecoration(color: Colors.blueGrey.shade50),
//                            child: Card(
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  Text("Summary",
//                                      style: TextStyle(fontSize: 16, fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.bold)),
//                                  SizedBox(
//                                    height: 12,
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.fromLTRB(20.0, 0, 0.0, 0),
//                                    child: Table(
//                                        children: [
//                                          TableRow(children: [
//                                            Text("Subtotal",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                            SizedBox(width: 10.0),
//                                            Text("1,02,000",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                          ]),
//                                          TableRow(children: [
//                                            Text("Shipping Charge",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                            SizedBox(width: 10.0),
//                                            Text("Free",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                          ]),
//                                          TableRow(children: [
//                                            Text("Shipping Insurance",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                            SizedBox(width: 10.0),
//                                            Text("Free",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                          ]),
//                                          TableRow(children: [
//                                            Text("Grand Total",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                            SizedBox(width: 10.0),
//                                            Text("1,02,000",style: TextStyle(fontFamily: 'PlayfairDisplay')),
//                                          ]),
//                                        ]),
//                                  ),
//                                  SizedBox(height: 30),
//                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),
//                                    child: Column(
//                                      children: <Widget>[
//                                        Row(
//                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                          children: <Widget>[
//                                            iconBuild('assets/images/cartimages/partnership.png', 'Jewls', 'Partnership'),
//                                            iconBuild('assets/images/cartimages/Layer 12.png', '15 Days', 'Money Back'),
//                                            iconBuild('assets/images/cartimages/warranty.png', '1-Year', 'Warranty'),
//                                          ],
//                                        ),
//                                        SizedBox(height: 30.0),
//                                        Row(
//                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                          children: <Widget>[
//                                            iconBuildStack('assets/images/cartimages/diamond.png', 'Lifetime', 'Exchange'),
//                                            iconBuildStack('assets/images/cartimages/rupee.png', 'Lifetime', 'Buy'),
//                                            iconBuild('assets/images/cartimages/Layer 13.png', '100%', 'Certified'),
//                                          ],
//                                        ),
//                                      ],
//                                    ),
//                                  )
//                                ],
//                              ),
//                            )
//                          )
//                        ],
//                      )
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 20.0,
                    color: Color(0xFF131F3F),
                    child: Center(
                      child: InkWell(
                        onTap: (){},
                        child: Text(
                          'PLACE ORDER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 18.0,
                              color: Colors.white,
                          ),
                        ),
                      ),
                    )
              )
            )
          ],
        ),

      ),
    );
  }
}

class SingleItem extends StatefulWidget {
  final itemImage;
  final itemPrice;
  final itemName;
  final itemCode;

  SingleItem({this.itemImage, this.itemPrice, this.itemName, this.itemCode});

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  IconData icon = Icons.delete_outline;

  //_isClicked monitors when the heart icon is clicked
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(5.0),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21.0)
          ),
//        elevation: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 5.0),
              child: Container(
                width: 120.0,
                height: 150.0,
                child: Image.asset(
                  widget.itemImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.itemName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'PlayfairDisplay',
                    color: Color(0xFFB79389),
                  ),
                ),
                Text(
                  widget.itemCode,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.itemPrice,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19.0,
                    fontFamily: 'PlayfairDisplay',
                    color: kInactiveSearchPageTextColor,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Qty: 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'PlayfairDisplay',
                        color: kInactiveSearchPageTextColor,
                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        iconSize: 30.0,
                        icon: Icon(Icons.arrow_drop_down),
                        color: Color(0xFF7E3338),
                    )
                  ],
                ),
                Text(
                  'Ship By: 30 June 2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'PlayfairDisplay',
                    color: kInactiveSearchPageTextColor,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  icon,
                  size: 20.0,
                ),
                color: Colors.brown,
                onPressed: () {
                  setState(() {
                    _isClicked = !_isClicked;
                    icon = _isClicked ? Icons.delete : Icons.delete_outline;
                  });
                },
              ),

            ),
          ],
        ),
      );
  }
}
