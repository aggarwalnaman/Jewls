import 'package:flutter/material.dart';
import 'package:jewls/auth.dart';
import 'package:jewls/login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
             Stack(
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
                 Padding(
                     padding: EdgeInsets.fromLTRB(0.0, 45.0, 327, 21.0),
                     child: IconButton(
                       icon: Icon(
                         Icons.arrow_back_ios,
                         color: Colors.white,
                       ),
                       onPressed: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => LoginPage()),
                         );
                       }
                     ),
                 )
               ],
             ),
              SizedBox(height: 220.0),
              Padding(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ) ,
                ),
                padding: EdgeInsets.symmetric(horizontal: 35.0),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(38.0, 62.0, 37.0, 0.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        labelStyle: TextStyle(
                            color: Colors.grey[400]
                        )
                    ),
                  ),
              ),
              SizedBox(height: 93.0),
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
                          },
                          child: Text('Reset Password',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.brown),),
                        ),
                      )
                  )
              ),
              SizedBox(height: 100.0),
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
