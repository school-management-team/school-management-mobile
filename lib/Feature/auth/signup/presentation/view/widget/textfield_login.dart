import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TextFieldLogin extends StatefulWidget {
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextInputType? textinputtype;
  final String? Function(String?)? validator;
  const TextFieldLogin({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.textinputtype,
    this.validator,
  });
  @override
  State<TextFieldLogin> createState() => TextFieldLoginState();
}

class TextFieldLoginState extends State<TextFieldLogin> {
  bool isObscured = true;
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? isObscured : false,
      keyboardType: widget.textinputtype,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextSt.textstyle14.copyWith(color: Colors.grey),
        prefixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
              )
            : widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Colors.grey)
            : null,
        suffixIcon: widget.suffixIcon != null
            ? Icon(widget.suffixIcon, color: Colors.grey)
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Color(0xFF091C31).withOpacity(0.1),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: kcolorOlive.withOpacity(0.1),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
