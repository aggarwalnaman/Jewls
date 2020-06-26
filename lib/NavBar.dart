import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewls/sub_pages/cart.dart';

class navBar extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    Widget itemTile(String name, Function onTap){
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 30.0,
            child: InkWell(
              onTap: onTap,
              child: Text(
                  name,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF707070)
                ),
              ),
            ),
          ),
        );
    }
    Widget subTile(String name, Function onTap){
      return Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 25.0,
            child: InkWell(
              onTap: onTap,
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF707070),
                    fontFamily: 'PlayfairDisplay',
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           Container(
             height: 120.0,
             color: Color(0xFFD5A893),
             child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {

                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Home',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'PlayfairDisplay',
                          ),
                        ),
                      ),
                      SizedBox(width: 130.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('Jewls',
                            style: TextStyle(
                              color: Color(0xFF7E3338),
                              fontSize: 23.0,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                      //Text('Jewls'),
               ],
              ),
             )
           ),
          Padding(padding: EdgeInsets.only(left: 30, top: 10.0),
            child: Column(
              children: <Widget>[
                itemTile('Shop for', (){}),
                Padding(padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Column(
                   children: <Widget>[
                    ExpansionTile(
                        title: Text(
                          'Women',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF707070)
                          ),
                        ),
                        trailing: InkWell(
                          child: Icon(Icons.add),
                          onTap: (){

                          },
                        ),
                      children: <Widget>[
                        subTile('Rings', (){}),
                        subTile('Earrings', (){}),
                        subTile('Pendants', (){}),
                        subTile('Bracelets', (){}),
                        subTile('Necklaces', (){}),
                        subTile('Nose Pins', (){}),
                        subTile('Chains', (){}),
                        subTile('Mangalsutra', (){}),
                        subTile('All Women Jewellery', (){}),
                      ],
                    ),
                     ExpansionTile(
                         title: Text(
                           'Men',
                           style: TextStyle(
                               fontWeight: FontWeight.w300,
                               color: Color(0xFF707070)
                           ),
                         ),
                         trailing: Icon(Icons.add),
                       children: <Widget>[
                         subTile('Rings', (){}),
                         subTile('Kada', (){}),
                         subTile('Cuff links', (){}),
                         subTile('Braceletes', (){}),
                         subTile('Chains', (){}),
                         subTile('All Men Jewellery', (){}),
                       ],
                     ),
                     ExpansionTile(
                         title: Text(
                           'Kids',
                           style: TextStyle(
                               fontWeight: FontWeight.w300,
                               color: Color(0xFF707070)
                           ),
                         ),
                         trailing: Icon(Icons.add),
                       children: <Widget>[
                         subTile('Kada', (){}),
                         subTile('Cuff links', (){}),
                         subTile('Braceletes', (){}),
                         subTile('Chains', (){}),
                         subTile('All Men Jewellery', (){}),
                       ],
                     ),
                   ],
                  ),
                ),
                itemTile('Jewellery', (){}),
                Padding(padding: EdgeInsets.only(left: 20.0,right: 10.0),
                  child: Column(
                    children: <Widget>[
                      ExpansionTile(
                          title: Text(
                            'Diamond',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF707070)
                            ),
                          ),
                          trailing: Icon(Icons.add),
                        children: <Widget>[
                          subTile('Rings', (){}),
                          subTile('Earrings', (){}),
                          subTile('Pendants', (){}),
                          subTile('Bracelets', (){}),
                          subTile('Necklaces', (){}),
                          subTile('Nose Pins', (){}),
                          subTile('Chains', (){}),
                          subTile('Mangalsutra', (){}),
                          subTile('All Diamond Jewellery', (){}),
                        ],
                      ),
                      ExpansionTile(
                          title: Text(
                            'Gold',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF707070)
                            ),
                          ),
                          trailing: Icon(Icons.add),
                        children: <Widget>[
                          subTile('Rings', (){}),
                          subTile('Earrings', (){}),
                          subTile('Pendants', (){}),
                          subTile('Bracelets', (){}),
                          subTile('Necklaces', (){}),
                          subTile('Nose Pins', (){}),
                          subTile('Chains', (){}),
                          subTile('Mangalsutra', (){}),
                          subTile('All Gold Jewellery', (){}),
                        ],
                      ),
                      ExpansionTile(
                          title: Text(
                            'Platinum',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF707070)
                            ),
                          ),
                          trailing: Icon(Icons.add),
                        children: <Widget>[
                          subTile('Rings', (){}),
                          subTile('Kada', (){}),
                          subTile('Cuff links', (){}),
                          subTile('Braceletes', (){}),
                          subTile('Chains', (){}),
                          subTile('All Platinum Jewellery', (){}),
                        ],
                      ),
                      ExpansionTile(
                          title: Text(
                            'Solitaire',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF707070)
                            ),
                          ),
                          trailing: Icon(Icons.add),
                        children: <Widget>[
                          subTile('Rings', (){}),
                          subTile('Kada', (){}),
                          subTile('Cuff links', (){}),
                          subTile('Braceletes', (){}),
                          subTile('Chains', (){}),
                          subTile('All Solitaire Jewellery', (){}),
                        ],
                      ),
                    ],
                  ),
                ),
                itemTile('My Orders', (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> CartPage())
                  );
                }
                ),
                itemTile('My Account', (){}),
                itemTile('Settings', (){}),
                itemTile('Customer Care', (){}),
                itemTile('Logout', (){}),
              ],
            ),
          )
        ],
      ),
    );

  }
}
