import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/utils/app_dimens.dart';
import 'package:my_fitness_coach/utils/app_fonts.dart';
import 'package:my_fitness_coach/utils/behavior.dart';

import '../../components/button_component.dart';
import '../../components/curved_widget.dart';
import '../../components/register/simple_input_textfield.dart';
import '../../utils/colors.dart';
import '../register/register_page.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
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
                            colors: [
                              AppColors.brandColor,
                              AppColors.whileColor
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    "Đăng Nhập",
                                    style: TextStyle(
                                        fontSize: 34.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whileColor),
                                  ),
                                  Text(
                                    "Chào Mừng bạn đến với MY LOVE APP",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whileColor),
                                  ),
                                ],
                              ),
                            ),
                            // Lottie.asset('assets/image_json/img_splash.json',
                            //     height: 180.0, width: 180.0),
                          ],
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 260),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              SimpleInputTextField(
                                obscureText: false,
                                hintText: 'Nhập vào Email',
                                hintColor: AppColors.secondColor,
                                textColor: AppColors.blackColor,
                                labelText: "Email",
                                controller: loginController.emailController,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Obx(
                                () => SimpleInputTextField(
                                  obscureText: loginController.isPassword.value,
                                  controller:
                                      loginController.passwordController,
                                  hintText: 'Nhập vào mật khẩu',
                                  hintColor: AppColors.secondColor,
                                  textColor: AppColors.blackColor,
                                  labelText: "Mật khẩu",
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      loginController.isPassword.value =
                                          !loginController.isPassword.value;
                                    },
                                    icon: Icon(
                                      loginController.isPassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.remove_red_eye_outlined,
                                      color: AppColors.secondColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: ButtonComponent(
                                  ontap: () {
                                    loginController
                                        .loginWithEmailAndPassword(context);
                                  },
                                  color: AppColors.secondColor,
                                  text: "Đăng nhập",
                                  width: 200.0,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: TextButton(
                                    onPressed: () {
                                      Get.to(RegisterPage());
                                    },
                                    child: Text("Đăng ký tài khoản My Love")),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
