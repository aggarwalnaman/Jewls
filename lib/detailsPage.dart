import 'package:flutter/material.dart';
import 'package:jewls/Animation/FadeAnimation.dart';

class DetailsPage extends StatefulWidget {
  static const String id = '/DetailsPage';
  @override
  _DetailsPageState createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {
  String image1 = 'assets/images/1st.png';
  String image2 = 'assets/images/2nd.png';
  String currentImage = 'assets/images/1st.png';
  bool fitImage = true;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: FadeAnimation(0.5, Container(
          height: size.height,
          width: size.width,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Colors.black,
                  )),

              SizedBox(height: 0),
              FadeAnimation(1,Container(
                  height: size.height * 0.33,
                  width: size.width,
                  child: fitImage == true
                      ? Image.asset(
                    currentImage,
                    fit: BoxFit.cover,
                  )
                      : Stack(
                    children: <Widget>[
                      Image.asset(
                        currentImage,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentImage = image1;
                              fitImage = true;
                              print('touched');
                            });
                          },
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  )
              )
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: Container(
                  height: size.height * 0.45,
                  width: size.width,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                height: 40,
                                width: 40,
                                child: FloatingActionButton(
                                  heroTag: null,
                                  backgroundColor: Colors.white,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.more_horiz,
                                size: 40,
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                height: 40,
                                width: 40,
                                child: FloatingActionButton(

                                  backgroundColor: Colors.white,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.share,
                                    size: 25,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 180,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        20.0),
                                    side: BorderSide(color: Color(0xff05164D)),
                                  ),
                                  color: Colors.transparent,
                                  textColor: Color(0xff05164D),
                                  padding: EdgeInsets.all(2),
                                  onPressed: () {
                                    setState(() {
                                      currentImage = image2;
                                      fitImage = false;
                                    });
                                  },
                                  child: Text(
                                    "Will It Fit ?",
                                    style: TextStyle(
                                      fontSize: 12.0,
//                                    fontFamily: 'PlayfairDisplay',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text(
                                  'Isabel Halo Earring',
                                  style: TextStyle(
                                      color: Color(0xff05164D),
                                      fontSize: 22,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  '₹ 20,000 (including GST.)',
                                  style: TextStyle(
                                      color: Color(0xff05164D),
                                      fontSize: 12.5,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Our 18k rose gold flatters all skin tones and is',
                                  style: TextStyle(
                                      color: Color(0xff05164D),
                                      fontSize: 10,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Our 18k rose gold flatters all skin tones and is',
                                  style: TextStyle(
                                      color: Color(0xff05164D),
                                      fontSize: 10,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Our 18k rose gold flatters all skin tones and is',
                                  style: TextStyle(
                                      color: Color(0xff05164D),
                                      fontSize: 10,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 25),
                                Row(

                                  children: <Widget>[
                                    Text(
                                      'Reviews',
                                      style: TextStyle(
                                          color: Color(0xff05164D),
                                          fontSize: 10,
                                          fontFamily: 'PlayfairDisplay',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text('|'),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      '4.9',
                                      style: TextStyle(
                                          color: Color(0xff05164D),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffB76E79),
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffB76E79),
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffB76E79),
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffB76E79),
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: Color(0xffB76E79),
                                      size: 19,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: size.height * 0.09,
                  width: size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 250,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            color: Color(0xff05164D),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 0),
                        Container(
                          height: 60,
                          width: 125,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            color: Color(0xff05164D),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            child: Text(
                              'Try on',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'PlayfairDisplay',
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        )
        )
    );
  }
}
