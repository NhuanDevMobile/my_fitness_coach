import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../utils/singleton.dart';

class BottomBarController extends GetxController {
  int currentIndex = 0;
  final PageController pageController = PageController();
  RxInt unReadMSGCount = 0.obs;
  RxInt unReadNotificationCount = 0.obs;
  UserModel user = Singleton().user!;
  String titleAppBar = "";

  @override
  void onInit() {
    super.onInit();
    if (user != null) {}
  }

  onTapBottomBar(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    if (index == 2) {
      titleAppBar = "Nhật ký";
      update(['fetchTitle']);
    } else if (index == 3) {
      titleAppBar = "Trang cá nhân";
      update(['fetchTitle']);
    } else {
      titleAppBar = '';
      update(['fetchTitle']);
    }
    update(['updateBottomBar']);
  }
}
