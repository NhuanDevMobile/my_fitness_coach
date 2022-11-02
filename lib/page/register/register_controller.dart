import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/utils/validators.dart';

class RegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordReController = TextEditingController();
  RxBool isCheckEmail = true.obs;
  RxBool isCheckPassword = true.obs;
  RxBool isCheckRePassword = true.obs;
  RxBool isPassword = true.obs;
  RxBool isRePassword = true.obs;

  // registerWithEmail(BuildContext context) async {
  //   DialogsUtils.showAlterLoading(context);
  //   await UserRepository.signUpWithEmail(
  //       emailController.text,
  //       passwordController.text,
  //       lastNameController.text,
  //       firstNameController.text, (e) {
  //     DialogsUtils.showAlert(
  //         "Thành công", "Đăng ký tài khoản thành công", context, "success", () {
  //       emailController.clear();
  //       passwordController.clear();
  //       passwordReController.clear();
  //       firstNameController.clear();
  //       lastNameController.clear();
  //       Get.back();
  //       Get.back();
  //     });
  //   }, (catchError) {
  //     DialogsUtils.showAlert("Lỗi", catchError.toString(), context, "error",
  //         () {
  //       Get.back();
  //       Get.back();
  //     });
  //   });
  // }

  checkValidateEmail() {
    if (emailController.text.isEmpty) {
      isCheckEmail.value = true;
    } else {
      isCheckEmail.value = Validators.isValidEmail(emailController.text);
    }
  }

  checkValidatePassword() {
    if (passwordController.text.isEmpty) {
      isCheckPassword.value = true;
    } else {
      isCheckPassword.value =
          Validators.isValidPassword(passwordController.text);
    }
  }

  checkValidateRePassword() {
    if (passwordController.text != passwordReController.text) {
      isCheckRePassword.value = false;
    } else {
      isCheckRePassword.value = true;
    }
  }
}
