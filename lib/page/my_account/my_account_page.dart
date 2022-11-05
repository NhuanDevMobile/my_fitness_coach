import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/item_menu.dart';
import '../../models/menu_model.dart';
import '../../utils/colors.dart';
import '../../utils/navigation_transition.dart';
import 'my_account_controller.dart';

class MyAccountPage extends StatelessWidget {
  MyAccountPage({Key? key}) : super(key: key);
  MyAccountController myAccountController = Get.put(MyAccountController());
  List<MenuModel> listMenu1 = [
    MenuModel(icon: "", title: "Xem trang cá nhân"),
    MenuModel(icon: "", title: "Công thức trọng lượng cơ thể lý tưởng"),
    MenuModel(icon: "", title: "Cài đặt"),
  ];
  List<MenuModel> listMenu2 = [
    MenuModel(icon: "", title: "Đăng xuất"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // decoration: BoxDecoration(gradient: AppColors.brandColor),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Go.to(
              () => MyAccountPage(),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: 60.0,
              color: AppColors.whileColor,
              child: Row(
                children: [
                  // GetBuilder<MyAccountController>(
                  //   id: "updateUserProfile",
                  //   builder: (_) => AvatarComponent(
                  //     firstName:
                  //         myAccountController.profile.firstName.toString(),
                  //     lastName: myAccountController.profile.lastName.toString(),
                  //     avatar: myAccountController.profile.avatarURL.toString(),
                  //     width: 60.0,
                  //     height: 60.0,
                  //   ),
                  // ),
                  SizedBox(
                    width: 14.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<MyAccountController>(
                        id: "updateUserProfile",
                        builder: (_) => Text(
                            " myAccountController.profile.fullName().toString(),"
                            // style: style1,
                            ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("Xem trang cá nhân")
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView.builder(
              itemCount: listMenu1.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                MenuModel item = listMenu1[index];
                return ItemMenu(
                  item: item,
                  index: index,
                  length: listMenu1.length,
                  onTap: () {
                    switch (index) {
                      case 1:
                        // Get.to(SettingPage());
                        break;
                    }
                  },
                );
              }),
          SizedBox(
            height: 10.0,
          ),
          ListView.builder(
              itemCount: listMenu2.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                MenuModel item = listMenu2[index];
                return ItemMenu(
                  item: item,
                  onTap: () {
                    switch (index) {
                      case 0:
                      //Singleton().logout();
                    }
                  },
                  index: index,
                  length: listMenu2.length,
                );
              }),
        ],
      ),
    ));
  }
}
