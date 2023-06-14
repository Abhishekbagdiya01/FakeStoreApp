import 'package:fake_store_app/presentation/screens/const/colors.dart';
import 'package:fake_store_app/presentation/screens/widgets/text_styles.dart';
import 'package:flutter/material.dart';

class StoreButton extends StatelessWidget {
  StoreButton({
    required this.text,
    required this.height,
    required this.width,
  });
  
  String text;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: secondaryColor),
      child: Center(
          child: Text(
        text,
        style: TextStyle22(color: Colors.white),
      )),
    );
  }
}
