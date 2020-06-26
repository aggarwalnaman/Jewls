import 'package:flutter/material.dart';
import 'package:jewls/detailsPage.dart';
import 'package:jewls/filterPage.dart';
import 'package:jewls/welcome.dart';
import 'auth.dart';
import 'home_page.dart';
import 'phone_verify.dart';
import 'sub_pages/cart.dart';
import 'EarringsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jewls',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
      ),
      initialRoute: HomePage.id,
      routes: {

        WelcomePage.id: (context) => WelcomePage(),
        AuthPage.id: (context) => AuthPage(),
        VerifyPage.id: (context) => VerifyPage(),
        HomePage.id: (context) => HomePage(),
        CartPage.id: (context) => CartPage(),
        EarringsPage.id: (context) => EarringsPage(),
        DetailsPage.id: (context) => DetailsPage(),
        FilterPage.id: (context) => FilterPage(),

      },
    );
  }
}
