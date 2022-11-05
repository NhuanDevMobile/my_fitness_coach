import 'package:flutter/material.dart';
import 'package:my_fitness_coach/models/exercise_model.dart';
import 'package:my_fitness_coach/utils/app_dimens.dart';
import 'package:my_fitness_coach/utils/app_fonts.dart';
import 'package:my_fitness_coach/utils/colors.dart';

class ItemExerciseComponent extends StatelessWidget {
  VoidCallback onTap;
  ExerciseModel item;
  ItemExerciseComponent({Key? key, required this.onTap, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whileColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.only(right: 4.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                item.gifUrl.toString(),
              ))),
            ),
            Expanded(
              child: Text(
                item.name.toString(),
                style: TextStyle(
                    fontFamily: AppFonts.RobotoSlab,
                    fontSize: AppDimens.text_size_14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Icon(
              Icons.navigate_next,
              color: AppColors.brandColor,
            )
          ],
        ),
      ),
    );
  }
}
