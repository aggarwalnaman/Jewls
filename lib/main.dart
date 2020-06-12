import 'package:flutter/material.dart';
import 'package:jwels/detailsPage.dart';
import 'package:jwels/searchPage.dart';
import 'package:jwels/welcome.dart';
import 'auth.dart';
import 'home_page.dart';
import 'phone_verify.dart';
import 'sub_pages/cart.dart';
import 'EarringsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jwels',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (context) => WelcomePage(),
        '/auth': (context) => AuthPage(),
        '/verify': (context) => VerifyPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/earrings': (context) => EarringsPage(),
        '/details': (context) => DetailsPage(),
        '/SearchPage': (context) => SearchPage(),
      },
    );
  }
}
