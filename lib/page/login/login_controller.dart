import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPassword = true.obs;

  // loginWithEmailAndPassword(BuildContext context) async {
  //   DialogsUtils.showAlterLoading(context);
  //   await UserRepository.login(emailController.text, passwordController.text,
  //       (isLogin, msg) {
  //     if (isLogin) {
  //       Get.offAll(BottomNavigationBarPage());
  //     } else {
  //       DialogsUtils.showAlert(
  //           "Thất bại", "Đăng nhập không thành công", context, "error", () {
  //         Get.back();
  //         Get.back();
  //       });
  //     }
  //   });
  // }
}
