import 'dart:async';

import 'package:get/get.dart';
import 'package:my_fitness_coach/page/login/login_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(LoginPage());
    });
    super.onInit();
  }
}
