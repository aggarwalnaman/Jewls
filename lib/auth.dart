import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewls/login.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}
class AuthPageState extends State<AuthPage>{
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  bool validate1=false;
  bool validate2=false;
  bool validate3=false;
  bool validate4=false;

  @override
  Widget build(BuildContext context) {
    Widget socialBtn(Function onTap, AssetImage logo){
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 51.0,
          width: 51.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: logo,
            ),
          ),
        ),
      );
    }

    Widget socialBtnRow(){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 118.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            socialBtn(
                    () => print('fb log in'),
                AssetImage(
                    'assets/images/facebook-2.png'
                )
            ),
            Text('OR', style: TextStyle(color: Colors.white),),
            socialBtn(
                    () => print('g+ log in'),
                AssetImage(
                    'assets/images/google-icon.png'
                )
            ),
          ],
        ),
      );
    }
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          key: _registerFormKey,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1],
                  colors: [Color(0xFF8F6255), Color(0xFFB79389)]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Exclusion 1.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 207.0,
                color: Colors.transparent,
                child: Center(
                  child: Image.asset('assets/images/Group 208.png')
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                child: Text(
                  'Create an Account..',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ) ,
                ),
                padding: EdgeInsets.symmetric(horizontal: 35.0),
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(37.5, 0.0, 37.5, 0.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child:  TextField(
                              decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                      color: Colors.grey[400]
                                  ),
                                errorText: validate1 ? 'Value Can\'t Be Empty' : null,
                              ),
                              controller: _nameController,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 5,
                            child:  TextField(
                              decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  errorText: validate2 ? 'Value Can\'t Be Empty' : null,
                                  labelStyle: TextStyle(
                                      color: Colors.grey[400]
                                  )
                              ),
                              controller: _lastnameController,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'E-mail/Mobile Number',
                            errorText: validate3 ? 'Value Can\'t Be Empty' : null,
                            labelStyle: TextStyle(
                                color: Colors.grey[400]
                            )
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: validate4 ? 'Value Can\'t Be Empty' : null,
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            )
                        ),
                        controller: _passController,
                      ),
                    ],
                  )
              ),
              SizedBox(height: 28.0),
              Padding(padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                      height: 45.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              _nameController.text.isEmpty ? validate1 = true : validate1 = false;
                              _lastnameController.text.isEmpty ? validate2 = true : validate2 = false;
                              _emailController.text.isEmpty ? validate3 = true : validate3 = false;
                              _passController.text.isEmpty ? validate4 = true : validate4 = false;
                            });

                               FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text)
                               .then((currentUser) => Firestore.instance
                               .collection("users")
                               .document(currentUser.user.toString())
                               .setData({
                                 "firstname": _nameController.text,
                                 "lastname": _lastnameController.text,
                                 "email": _emailController.text,

                               }).then((result) => {
                                 Navigator.pushAndRemoveUntil(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => LoginPage(

                                         )),
                                         (_) => false),
                                 _nameController.clear(),
                                 _lastnameController.clear(),
                                 _emailController.clear(),
                                 _passController.clear(),
                               })
                                   .catchError((err) => print(err)))
                                   .catchError((err) => print(err));
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Sending Message"),
                            ));
                          },
                          child: Text('Log In',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),),
                        ),
                      )
                  )
              ),
              SizedBox(height: 45.0),
              socialBtnRow(),
              SizedBox(height: 2.0),
              Text(
                '(Sign In via Social Media)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
    );
  }
}
