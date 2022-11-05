import 'package:flutter/material.dart';
import 'package:my_fitness_coach/utils/colors.dart';

import '../../utils/app_fonts.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppColors.whileColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'Năng lương nạp vào: ',
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: AppFonts.RobotoSlab,
                                  color: AppColors.secondColor,
                                  fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "2072 KCal",
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        fontFamily: AppFonts.RobotoSlab,
                                        color: AppColors.blackColor)),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.error_outlined,
                          color: AppColors.brandColor,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
