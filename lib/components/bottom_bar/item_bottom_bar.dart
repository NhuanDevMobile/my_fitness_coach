import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ItemBottomBarComponent extends StatelessWidget {
  int index;
  int currentIndex;
  VoidCallback onTap;
  String image;
  String text;
  ItemBottomBarComponent(
      {Key? key,
      required this.index,
      required this.currentIndex,
      required this.onTap,
      required this.image,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        color: AppColors.whileColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 30,
              width: 30,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              text,
              style: TextStyle(
                  color: index == currentIndex
                      ? AppColors.brandColor
                      : AppColors.blackColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
