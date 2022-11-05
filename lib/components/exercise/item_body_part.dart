import 'package:flutter/material.dart';
import 'package:my_fitness_coach/models/body_parts_model.dart';
import 'package:my_fitness_coach/utils/app_dimens.dart';
import 'package:my_fitness_coach/utils/app_fonts.dart';
import 'package:my_fitness_coach/utils/colors.dart';

class ItemBodyParts extends StatelessWidget {
  BodyPartsModel item;
  VoidCallback onTap;
  ItemBodyParts({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Text(
                item.bodyPartNameVN.toString(),
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: AppDimens.text_size_18,
                    fontFamily: AppFonts.RobotoSlab),
              ),
            ),
            Spacer(),
            item.imageUrl.toString().isNotEmpty
                ? Image.network(
                    item.imageUrl.toString(),
                    height: 130,
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
