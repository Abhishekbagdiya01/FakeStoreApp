import 'package:flutter/material.dart';

class VerticalSpaceBox extends StatelessWidget {
  VerticalSpaceBox({super.key, required this.height});
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSpaceBox extends StatelessWidget {
  HorizontalSpaceBox({super.key, required this.width});
  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
