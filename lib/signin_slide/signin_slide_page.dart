import 'package:flutter/material.dart';
import 'package:jobbag_login_test/signin_slide/email_section.dart';
import 'package:jobbag_login_test/signin_slide/password_section.dart';
import 'package:jobbag_login_test/signin_slide/select_profession_page.dart';

class SignInSlidePage extends StatefulWidget {

  static int currentPage = 0;
  static int totalPages = 3;
  static final pageController = PageController();
  static String email;
  static String password;

  @override
  _SignInSlidePageState createState() => _SignInSlidePageState();
}

class _SignInSlidePageState extends State<SignInSlidePage> {

  List<Widget> dots = [Dot(true), Dot(false), Dot(false)];

  List<Widget> pages = [
    TextInputSection(isPassword: false, hintTxt: "What's your email?", labelTxt: "Email"),
    TextInputSection(isPassword: true, hintTxt: "What's your password?", labelTxt: "Password"),
    SelectProfessionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: SignInSlidePage.pageController,
          children: pages,
          onPageChanged: (page){
            setState(() {
              int previousPage = SignInSlidePage.currentPage;
              SignInSlidePage.currentPage = page;
              dots[SignInSlidePage.currentPage] = Dot(true);
              dots[previousPage] = Dot(false);
            });
          },
        )
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: dots,
          ),
        ),
      )
    );
  }

}


class Dot extends StatelessWidget {

  final bool selected;

  Dot(this.selected);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
              color: selected ? Theme.of(context).primaryColor : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).primaryColor, width: 2.0)
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0))
      ],
    );
  }
}


