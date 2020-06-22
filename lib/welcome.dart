import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewls/login.dart';
//import 'package:jewls/plogin.dart';
import 'auth.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                height: 118.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Exclusion 1.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 210.0,
                color: Colors.transparent,
                child: Center(
                    child: Image.asset('assets/images/Group 208.png')
                ),
              ),
              SizedBox(height: 90.0),
              Padding(
                child: Text(
                  'Welcome!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 39.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ) ,
                ),
                padding: EdgeInsets.symmetric(horizontal: 35.0),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(53.0, 50.0, 53.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Please login by using given credentials',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'and enjoy your workplace',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 43.0),
              Padding(padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Text('Sign In',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.brown),),
                        ),
                      )
                  )
              ),
              SizedBox(height: 22.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New Here?   ',
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
                      'Create Account',
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



/*
 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPage()),
                      );
 */