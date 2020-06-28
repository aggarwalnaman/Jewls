import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  static const String id = '/Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  String mainUrl;
/*  String useremail;
    void userMail() async{
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    useremail=user.email.toString();
  }*/

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
      String filename = basename(_image.path);
      StorageReference reference =
          FirebaseStorage.instance.ref().child(filename);
      StorageUploadTask uploadTask = reference.putFile(_image);
      uploadTask.onComplete.then((onValue) async {
        mainUrl = (await reference.getDownloadURL()).toString();
        print(mainUrl);
        DatabaseReference databasereference =
            FirebaseDatabase.instance.reference().child('Naaniz');
        databasereference.child("Profile").push().set({
          LoginPageState.useremail.substring(0, 6): mainUrl,
        }).then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("profile uploaded successfully"),
          ));
        });
      });
    }

    /*  Future uploadImage(BuildContext)async{
       String filename=basename(_image.path);
       StorageReference reference=FirebaseStorage.instance.ref().child(filename);
       StorageUploadTask uploadTask=reference.putFile(_image);
       StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
       setState(() {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("profile uploaded successfully"),));
       });
    }*/
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: Builder(
        builder: (context) => Container(
          width: deviceWidth * 1,
          margin: EdgeInsets.fromLTRB(10, 50, 10, 60),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Card(
            margin: EdgeInsets.fromLTRB(8, 80, 8, 5),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 55,
                        child: ClipOval(
                          child: SizedBox(
                            height: 109,
                            width: 109,
                            child: (LoginPageState.userimage != null)
                                ? Image.network(
                                    LoginPageState.userimage,
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        LoginPageState.useremail,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(13, 5, 13, 0),
                  child: Divider(
                    color: Colors.black,
                    height: 25,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          "INFORMATION",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.payment,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "Payment Method",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(95, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.card_giftcard,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "My Orders",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(150, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "My Wishlist",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(140, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.account_balance_wallet,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "My Try-on",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(155, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.local_activity,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "My Offer",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(165, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.local_offer,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "Address Book",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(125, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 10, 0, 0),
                      child: Icon(
                        Icons.signal_cellular_no_sim,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(170, 10, 0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
