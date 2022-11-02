import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ButtonComponent extends StatelessWidget {
  VoidCallback ontap;
  String text;
  double? height;
  double? width;
  Color? color;

  ButtonComponent(
      {Key? key,
      required this.ontap,
      required this.text,
      this.height = 40.0,
      this.width,
      this.color = AppColors.brandColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: AppColors.whileColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
