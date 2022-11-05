import 'package:flutter/material.dart';
import 'package:my_fitness_coach/utils/style.dart';

import '../models/menu_model.dart';
import '../utils/colors.dart';

class ItemMenu extends StatelessWidget {
  MenuModel item;
  VoidCallback onTap;
  int? index;
  int? length;
  double? height;

  ItemMenu(
      {Key? key,
      required this.item,
      required this.onTap,
      this.height = 50.0,
      this.index,
      this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        color: AppColors.whileColor,
        child: Row(
          children: [
            item.icon.toString().isNotEmpty
                ? Image.asset(
                    item.icon.toString(),
                    height: 24.0,
                    width: 24.0,
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: length! - 1 == index
                                ? AppColors.whileColor
                                : AppColors.greyColor))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title.toString(),
                      style: styleTitle,
                    ),
                    item.content == null
                        ? SizedBox.shrink()
                        : Text(item.content.toString()),
                  ],
                ),
              ),
            ),
            Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }
}
