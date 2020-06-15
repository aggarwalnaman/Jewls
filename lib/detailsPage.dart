import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 48),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.black,
                )),
            SizedBox(height: 20),
            Container(
                height: size.height * 0.35,
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
                      )),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xffDADADA),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Colors.white,
                                onPressed: () {},
                                child: Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color: Color(0xffB76E79),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              size: 40,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: () {},
                                child: Icon(
                                  Icons.share,
                                  size: 15,
                                  color: Color(0xffB76E79),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 130,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  side: BorderSide(color: Color(0xff05164D)),
                                ),
                                color: Colors.transparent,
                                textColor: Color(0xff05164D),
                                padding: EdgeInsets.all(5),
                                onPressed: () {
                                  setState(() {
                                    currentImage = image2;
                                    fitImage = false;
                                  });
                                },
                                child: Text(
                                  "WILL IT FIT?",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Isabel Halo Earring',
                                style: TextStyle(
                                    color: Color(0xff05164D),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '₹ 20,000',
                                style: TextStyle(
                                    color: Color(0xff05164D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Our 18k rose gold flatters all skin tones and is',
                                style: TextStyle(
                                    color: Color(0xff05164D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Our 18k rose gold flatters all skin tones and is',
                                style: TextStyle(
                                    color: Color(0xff05164D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Our 18k rose gold flatters all skin tones and is',
                                style: TextStyle(
                                    color: Color(0xff05164D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                        color: Color(0xff05164D),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('|'),
                                  SizedBox(
                                    width: 15,
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
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Container(
                height: size.height * 0.09,
                width: size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 200,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          color: Color(0xff05164D),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(5),
                          onPressed: () {},
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 60,
                        width: 120,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          color: Color(0xff05164D),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(5),
                          onPressed: () {},
                          child: Text(
                            'Try on',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
