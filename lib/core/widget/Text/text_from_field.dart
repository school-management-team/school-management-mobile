
import 'package:flutter/material.dart';
import 'package:school/constant.dart';

class TextFieldStyle extends StatelessWidget {
  TextFieldStyle({
    super.key,
    required this.hinit,
    this.textAlign = TextAlign.start,
    this.icontext, required this.filledcolor,
 
  });
  final formKey = GlobalKey<FormState>();
  final formK = GlobalKey<FormState>();
  final String hinit;
  final TextAlign textAlign;
  final Icon? icontext;
  final Color filledcolor;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField( 
        decoration: InputDecoration(
          //focusedBorder: ,
          enabledBorder: OutlineInputBorder(
          
            borderRadius: BorderRadius.circular(8),
          
          borderSide: BorderSide(color: Color(0XFFC4C6CD),)),
          focusedBorder: OutlineInputBorder(
          
            borderRadius: BorderRadius.circular(8),
          
          borderSide: BorderSide(color: kcolorOlive,)),
          fillColor:filledcolor,filled: true,
          hint: Text(
            hinit,
            style: TextStyle(color: Color(0XFF6B7280)),
            textAlign: textAlign,
          ),
        suffixIcon: icontext
        ),
        
      ),
    );
  }
}
