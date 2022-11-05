import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/page/bottom_bar/bottom_bar_page.dart';

import '../../repositories/user_repository.dart';
import '../../utils/dialogs.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPassword = true.obs;

  loginWithEmailAndPassword(BuildContext context) async {
    DialogsUtils.showAlterLoading(context);
    await UserRepository.login(emailController.text, passwordController.text,
        (isLogin, msg) {
      if (isLogin) {
        Get.offAll(BottomBarPage());
      } else {
        DialogsUtils.showAlert(
            "Thất bại", "Đăng nhập không thành công", context, "error", () {
          Get.back();
          Get.back();
        });
      }
    });
  }
}
