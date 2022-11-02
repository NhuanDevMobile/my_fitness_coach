import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/page/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  static String routeName = '/splash_page';
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // color: AppColors.brandColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset('assets/image_json/img_love.json',
            //     height: 200.0, width: 200.0, fit: BoxFit.cover),
            // Text(
            //   "MY LOVE",
            //   style: style8,
            // )
          ],
        ),
      ),
    );
  }
}
