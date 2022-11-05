import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/components/widgets/appbar_widget.dart';
import 'package:my_fitness_coach/configs/my_app_controller.dart';
import 'package:my_fitness_coach/page/diary/diary_page.dart';
import 'package:my_fitness_coach/page/exercise/exercise_page.dart';
import 'package:my_fitness_coach/page/my_account/my_account_page.dart';

import '../../components/bottom_bar/item_bottom_bar.dart';
import '../../utils/colors.dart';
import 'bottom_bar_controller.dart';

class BottomBarPage extends StatelessWidget {
  static String routeName = '/bottom_page';
  BottomBarPage({Key? key}) : super(key: key);
  final BottomBarController bottomBarController =
      Get.put(BottomBarController());
  final MyAppController myAppController = Get.find<MyAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: bottomBarController.pageController,
        onPageChanged: (int index) {
          bottomBarController.currentIndex = index;
          bottomBarController.update(["updateBottomBar"]);
        },
        children: [
          Container(
            child: Center(
              child: Text(
                "Coming soon",
                style: TextStyle(fontSize: 20.0, color: AppColors.brandColor),
              ),
            ),
          ),
          DiaryPage(),
          ExercisePage(),
          MyAccountPage(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  GetBuilder<BottomBarController> bottomNavigationBar() {
    return GetBuilder<BottomBarController>(
      id: "updateBottomBar",
      builder: (_) => Container(
        color: AppColors.whileColor,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: AppColors.whileColor,
          child: Container(
            height: 60,
            child: Row(
              children: [
                ItemBottomBarComponent(
                    currentIndex: bottomBarController.currentIndex,
                    index: 0,
                    image: "assets/icons/ic_profile.png",
                    text: "Kế hoạch",
                    onTap: () {
                      bottomBarController.onTapBottomBar(0);
                    }),
                ItemBottomBarComponent(
                    currentIndex: bottomBarController.currentIndex,
                    index: 1,
                    image: "assets/icons/ic_profile.png",
                    text: "Thực phẩm",
                    onTap: () {
                      bottomBarController.onTapBottomBar(1);
                    }),
                Spacer(),
                ItemBottomBarComponent(
                    currentIndex: bottomBarController.currentIndex,
                    index: 2,
                    image: "assets/icons/ic_exercise.png",
                    text: "Bài tập",
                    onTap: () {
                      bottomBarController.onTapBottomBar(2);
                    }),
                ItemBottomBarComponent(
                    currentIndex: bottomBarController.currentIndex,
                    index: 3,
                    image: "assets/icons/ic_profile.png",
                    text: "Cá nhân",
                    onTap: () {
                      bottomBarController.onTapBottomBar(3);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Opacity buildFloatingActionButton() {
    return Opacity(
      opacity: 1.0,
      child: Visibility(
        visible: true,
        child: GestureDetector(
          onTap: () {
            // Get.to(MyLovePage());
          },
          child: Container(
              height: 54.0,
              width: 54.0,
              decoration: BoxDecoration(
                  color: AppColors.brandColor, shape: BoxShape.circle),
              child: Text("Nhuan")),
        ),
      ),
    );
  }
}
