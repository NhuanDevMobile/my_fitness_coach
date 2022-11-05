import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app_string.dart';
import 'colors.dart';

class DialogsUtils {
  static void showAlert(
    String title,
    String message,
    BuildContext context,
    String type,
    VoidCallback onTapOk,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFEBEDF0),
            elevation: 50,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.brandColor, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            content: Wrap(
              children: [
                Container(
                  width: 337,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: type == "error"
                                ? AppColors.errorColor
                                : AppColors.successColor),
                        child: (Icon(
                          type == "error" ? Icons.priority_high : Icons.check,
                          color: Colors.white,
                        )),
                      ),
                      title.isNotEmpty
                          ? Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: type == "error"
                                      ? AppColors.errorColor
                                      : AppColors.successColor),
                            )
                          : SizedBox.shrink(),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 17, bottom: 21),
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF4B5767)),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Color(0xFFEBEDF0),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              primary: AppColors.greyColor, // background
                              onPrimary: Color(0xFFD2D3D4), // foreground
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                              )),
                          child: Text('OK',
                              style: TextStyle(
                                fontSize: 18,
                                color: type == "error"
                                    ? AppColors.errorColor
                                    : AppColors.successColor,
                              )),
                          onPressed: onTapOk,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  static void showAlertDetailPassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Center(
                    child: const Text(
                  'Điều kiện',
                  style: TextStyle(color: AppColors.footerColor),
                )),
                content: Text(AppString.requestPassword),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('OK'),
                  ),
                ]));
  }

  static void showAlterLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Center(
              child: LoadingAnimationWidget.threeRotatingDots(
            color: AppColors.brandColor,
            size: 40,
          ));
        });
  }

  static void showAlterSnackbar(BuildContext context, String content) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.brandColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.0,
            ),
            Image.asset(
              "assets/icons/ic_warning.png",
              height: 32.0,
            ),
            SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 6.0,
            ),
            TextButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: AppColors.secondColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
