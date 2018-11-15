import 'package:flutter/material.dart';
import 'package:jobbag_login_test/signin_slide/signin_slide_page.dart';

class TextInputSection extends StatefulWidget {

  final String labelTxt;
  final String hintTxt;
  final bool isPassword;

  TextInputSection({this.hintTxt, this.labelTxt, this.isPassword});


  @override
  _TextInputSectionState createState() => _TextInputSectionState();
}

class _TextInputSectionState extends State<TextInputSection> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(10.0)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              prefixIcon: Icon(widget.isPassword ? Icons.lock : Icons.email),
              labelText: widget.labelTxt,
              hintText: widget.hintTxt,
              suffixIcon: IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){
                setState(() {
                  SignInSlidePage.pageController.nextPage(duration: Duration(milliseconds: 1), curve: ElasticInOutCurve());
                });
              })
            ),
            obscureText: widget.isPassword,
            controller: _emailController,
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ],
      ),
    );
  }


}
