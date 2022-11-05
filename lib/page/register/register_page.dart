import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/page/register/register_controller.dart';

import '../../components/button_component.dart';
import '../../components/curved_widget.dart';
import '../../components/register/simple_input_textfield.dart';
import '../../utils/app_dimens.dart';
import '../../utils/app_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/dialogs.dart';
import '../../utils/style.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                CurvedWidget(
                  child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xfff2cbd0), Color(0xfff4ced9)],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/ic_barbell.png",
                                      height: 34.0,
                                    ),
                                    Text(
                                      " MY FITNESS COACH",
                                      style: TextStyle(
                                          fontSize: AppDimens.text_size_28,
                                          fontFamily: AppFonts.RobotoSlab,
                                          color: AppColors.secondColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  "Đăng Ký",
                                  style: TextStyle(
                                      fontSize: 34.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.whileColor),
                                ),
                                Text(
                                  "Chào Mừng bạn đến với MY FITNESS COACH",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.whileColor),
                                ),
                              ],
                            ),
                          ),
                          // Lottie.asset('assets/image_json/img_register.json',
                          //     height: 180.0, width: 180.0),
                        ],
                      )),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 260),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: buildFormRegister(context),
                    ))
              ],
            ),
          ),
        ));
  }

  buildFormRegister(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: SimpleInputTextField(
                  obscureText: false,
                  hintText: 'Nhập vào họ',
                  hintColor: AppColors.secondColor,
                  textColor: AppColors.blackColor,
                  labelText: "Họ",
                  controller: registerController.lastNameController,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: SimpleInputTextField(
                  obscureText: false,
                  hintText: 'Nhập vào tên',
                  hintColor: AppColors.secondColor,
                  textColor: AppColors.blackColor,
                  labelText: "Tên",
                  controller: registerController.firstNameController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          SimpleInputTextField(
            obscureText: false,
            hintText: 'Nhập vào Email',
            hintColor: AppColors.secondColor,
            textColor: AppColors.blackColor,
            labelText: "Email",
            controller: registerController.emailController,
            onChanged: (e) {
              registerController.checkValidateEmail();
            },
          ),
          Obx(() => registerController.isCheckEmail.value
              ? SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(left: 6.0, top: 6.0),
                  child: Text(
                    "Địa chỉ email không hợp lệ.",
                    style: erroStyle,
                  ),
                )),
          SizedBox(
            height: 20.0,
          ),
          Obx(
            () => SimpleInputTextField(
              obscureText: registerController.isPassword.value,
              controller: registerController.passwordController,
              hintText: 'Nhập vào mật khẩu',
              hintColor: AppColors.secondColor,
              textColor: AppColors.blackColor,
              labelText: "Mật khẩu",
              onChanged: (e) {
                registerController.checkValidatePassword();
                registerController.checkValidateRePassword();
              },
              suffixIcon: IconButton(
                onPressed: () {
                  registerController.isPassword.value =
                      !registerController.isPassword.value;
                },
                icon: Icon(
                  registerController.isPassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  color: AppColors.secondColor,
                ),
              ),
            ),
          ),
          Obx(() => registerController.isCheckPassword.value
              ? SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: 6.0, left: 6.0),
                  child: RichText(
                    text: new TextSpan(
                        text: 'Vui lòng nhập đúng định dạng mật khẩu ',
                        style: erroStyle,
                        children: [
                          new TextSpan(
                            text: 'Xem chi tiết',
                            style: TextStyle(
                                color: AppColors.secondColor,
                                fontFamily: AppFonts.RobotoSlab,
                                fontWeight: FontWeight.bold,
                                fontSize: AppDimens.text_size_12),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () =>
                                  DialogsUtils.showAlertDetailPassword(context),
                          )
                        ]),
                  ))),
          SizedBox(
            height: 20.0,
          ),
          Obx(
            () => SimpleInputTextField(
              obscureText: registerController.isRePassword.value,
              controller: registerController.passwordReController,
              hintText: 'Nhập lại mật khẩu',
              hintColor: AppColors.secondColor,
              textColor: AppColors.blackColor,
              labelText: "Nhập lại mật khẩu",
              onChanged: (e) {
                registerController.checkValidateRePassword();
              },
              suffixIcon: IconButton(
                onPressed: () {
                  registerController.isRePassword.value =
                      !registerController.isRePassword.value;
                },
                icon: Icon(
                  registerController.isRePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  color: AppColors.secondColor,
                ),
              ),
            ),
          ),
          Obx(
            () => Theme(
              data: Theme.of(context).copyWith(
                  unselectedWidgetColor: AppColors.secondColor,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      activeColor: AppColors.brandColor,
                      title: Text(
                        "Nam",
                        style: TextStyle(color: AppColors.secondColor),
                      ),
                      value: "Nam",
                      groupValue: registerController.sex.value,
                      onChanged: (value) {
                        registerController.sex.value = value.toString();
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: AppColors.brandColor,
                      selectedTileColor: AppColors.secondColor,
                      title: Text(
                        "Nữ",
                        style: TextStyle(color: AppColors.secondColor),
                      ),
                      value: "Nữ",
                      groupValue: registerController.sex.value,
                      onChanged: (value) {
                        registerController.sex.value = value.toString();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => registerController.isCheckRePassword.value
              ? SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(left: 6.0, top: 6.0),
                  child: Text(
                    "Mật khẩu không trùng khớp.",
                    style: erroStyle,
                  ),
                )),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ButtonComponent(
              ontap: () {
                registerController.registerWithEmail(context);
              },
              color: AppColors.secondColor,
              text: "Đăng ký",
              width: 200.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Bạn đã có tài khoản ?",
                )),
          )
        ],
      ),
    );
  }
}
