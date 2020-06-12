import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
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
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 490,
              decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(0.0, 2.0),
                      blurRadius: 25.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Welcome to Jewls.',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Let\'s get started',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
//                  Padding(
//                    padding: EdgeInsets.only(
//                        left: 16, right: 16, top: 32, bottom: 8),
//                    child: TextField(
//                      style: TextStyle(fontSize: 18),
//                      keyboardType: TextInputType.text,
//                      textCapitalization: TextCapitalization.words,
//                      decoration: InputDecoration(
//                        hintText: 'Name',
//                        enabledBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(8),
//                            borderSide: BorderSide(color: Colors.grey)),
//                        focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(8),
//                            borderSide: BorderSide(color: Colors.grey)),
//                      ),
//                      controller: _nameController,
//                    ),
//                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'E-Mail Address',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      controller: _emailController,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      controller: _passController,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("LOGIN NOW"),
                      textColor: Colors.green,
                      padding: EdgeInsets.all(16),
                      onPressed: () async {
                        final email = _emailController.text.toString().trim();
                        final pass = _passController.text.toString().trim();
//                        final name = _nameController.text.toString().trim();

                        FirebaseUser user = await login(email, pass);
                        if (user != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        } else {
                          print('error');
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
