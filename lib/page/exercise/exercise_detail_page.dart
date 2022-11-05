import 'package:flutter/material.dart';
import 'package:my_fitness_coach/components/widgets/appbar_widget.dart';
import 'package:my_fitness_coach/models/exercise_model.dart';
import 'package:my_fitness_coach/utils/app_dimens.dart';
import 'package:my_fitness_coach/utils/app_fonts.dart';
import 'package:my_fitness_coach/utils/behavior.dart';
import 'package:my_fitness_coach/utils/colors.dart';

class ExerciseDetailPage extends StatelessWidget {
  ExerciseModel item;
  ExerciseDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Chi tiết",
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.whileColor,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toString(),
                    style: TextStyle(
                        color: AppColors.secondColor,
                        fontSize: AppDimens.text_size_18,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.RobotoSlab),
                  ),
                  Image.network(item.gifUrl.toString()),
                  RichText(
                    text: TextSpan(
                      text: 'Loại hình: ',
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: AppFonts.RobotoSlab,
                          color: AppColors.secondColor,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: item.equipment,
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: AppFonts.RobotoSlab,
                                color: AppColors.blackColor)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Nhóm: ',
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: AppFonts.RobotoSlab,
                          color: AppColors.secondColor,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: item.target,
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: AppFonts.RobotoSlab,
                                color: AppColors.blackColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
