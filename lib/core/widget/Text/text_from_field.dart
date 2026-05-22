import 'package:flutter/material.dart';
import 'package:school/constant.dart';

class TextFieldStyle extends StatelessWidget {
  TextFieldStyle({
    super.key,
    required this.hinit,
    this.textAlign = TextAlign.start,
    this.icontext,
    required this.filledcolor,
    this.textEditingController,
    this.readonly = false,
    this.onPressed,
    this.obscure = false,
    this.max = 1,
  });
  final formKey = GlobalKey<FormState>();
  final formK = GlobalKey<FormState>();
  final String hinit;
  final TextAlign textAlign;
  final Icon? icontext;
  final Color filledcolor;
  final TextEditingController? textEditingController;
  final bool readonly;
  final VoidCallback? onPressed;
  final bool? obscure;
  final int? max;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        maxLines: max,
        obscureText: false,
        controller: textEditingController,
        readOnly: readonly,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),

            borderSide: BorderSide(color: Color(0XFFC4C6CD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),

            borderSide: BorderSide(color: kcolorOlive),
          ),
          fillColor: filledcolor,
          filled: true,
          hint: Text(
            hinit,
            style: TextStyle(color: Color(0XFF6B7280)),
            textAlign: textAlign,
          ),
          suffixIcon: icontext,
        ),
        onTap: onPressed,
      ),
    );
  }
}
