import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.height,
    required this.width,
    required this.label,
    required this.onClicked,
    super.key,
  });
  double width;
  double height;
  String label;
  VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onClicked,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
