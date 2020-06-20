import 'package:flutter/material.dart';
import 'package:jewls/detailsPage.dart';
import 'package:jewls/searchPage.dart';
import 'package:jewls/welcome.dart';
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
      title: 'Jewls',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => WelcomePage(),
        '/auth': (context) => AuthPage(),
        '/verify': (context) => VerifyPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/earrings': (context) => EarringsPage(),
        '/details': (context) => DetailsPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
