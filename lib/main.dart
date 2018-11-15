import 'package:flutter/material.dart';
import 'package:jobbag_login_test/signin_slide/select_profession_page.dart';
import 'package:jobbag_login_test/signin_slide/signin_slide_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.blue,
      ),
      home: new SignInSlidePage(),
    );
  }
}

