import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomItemDetailsView extends StatelessWidget {
  const CustomItemDetailsView({
    super.key,
    required this.colorText,
    required this.colorContainar,
    required this.titleText,
    this.topLeft = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
    this.topRight = Radius.zero,
  });
  final Color colorText;
  final Color colorContainar;
  final String titleText;
  final Radius topLeft;
  final Radius bottomLeft;
  final Radius topRight;
  final Radius bottomRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 160,
      decoration: BoxDecoration(
        color: colorContainar,
        borderRadius: BorderRadius.only(
          topLeft: topLeft,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
          topRight: topRight,
        ),
      ),
      child: Center(
        child: Text(
          titleText,
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
