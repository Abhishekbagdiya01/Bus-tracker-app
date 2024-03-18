import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.isHide,
      this.keyboardType,
      this.width,
      required this.hintText,
      required this.iconData});
  TextEditingController controller;
  bool? isHide;
  IconData iconData;
  String hintText;
  double? width;
  TextInputType? keyboardType = TextInputType.text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        child: TextField(
          controller: controller,
          obscureText: isHide ?? false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: Icon(iconData),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(21))),
        ),
      ),
    );
  }
}
