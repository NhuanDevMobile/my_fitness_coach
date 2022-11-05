import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/models/user_model.dart';
import 'package:my_fitness_coach/utils/time_helper.dart';
import 'package:my_fitness_coach/utils/validators.dart';

import '../../repositories/user_repository.dart';
import '../../utils/dialogs.dart';
import '../../utils/utils.dart';

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
  RxString sex = "Nam".obs;
  UserModel user = UserModel();

  registerWithEmail(BuildContext context) async {
    DialogsUtils.showAlterLoading(context);
    user.email = emailController.text;
    user.firstName = firstNameController.text;
    user.lastName = lastNameController.text;
    user.keywords = Utils.generateKeyword(user.fullName());
    user.sex = sex.value.toString();
    user.created = TimeHelper.getCurrentDate("dd/MM/yyyy HH:mm:ss");
    user.updated = TimeHelper.getCurrentDate("dd/MM/yyyy HH:mm:ss");
    user.dob = TimeHelper.getCurrentDate("dd/MM/yyyy HH:mm:ss");
    user.provider = "email";
    user.isDelete = false;
    user.status = false;
    await UserRepository.signUpWithEmail(
        user, emailController.text, passwordController.text, (e) {
      DialogsUtils.showAlert(
          "Thành công", "Đăng ký tài khoản thành công", context, "success", () {
        emailController.clear();
        passwordController.clear();
        passwordReController.clear();
        firstNameController.clear();
        lastNameController.clear();
        Get.back();
        Get.back();
      });
    }, (catchError) {
      DialogsUtils.showAlert("Lỗi", catchError.toString(), context, "error",
          () {
        Get.back();
        Get.back();
      });
    });
  }

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
