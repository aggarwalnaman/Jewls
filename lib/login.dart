import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewls/ForgotPassword.dart';
import 'package:jewls/auth.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
//  final _emailController = TextEditingController();
//  final _passController = TextEditingController();
//  final _nameController = TextEditingController();

  Future<FirebaseUser> login(String email, String pass) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result =
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

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
                height: 200.0,
                color: Colors.transparent,
                child: Center(
                   child: Image.asset('assets/images/Group 208.png')
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                child: Text(
                  'Existing User..',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ) ,
                ),
                padding: EdgeInsets.symmetric(horizontal: 35.0),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(37.5, 20.0, 37.5, 0.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'E-mail/Mobile Number',
                            labelStyle: TextStyle(
                                color: Colors.grey[400]
                            )
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            )
                        ),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.brown),
                      )
                  ),
                ),
              ),
              SizedBox(height: 20.0),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          child: Text('Log In',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),),
                        ),
                      )
                  )
              ),
              SizedBox(height: 10.0),
              socialBtnRow(),
              Text(
                '(Sign In via Social Media)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account?   ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.brown,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
