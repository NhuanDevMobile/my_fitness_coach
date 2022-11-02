import 'package:get/get.dart';

import '../page/splash/splash_page.dart';

class MyAppController extends GetxController {
  String routeName = SplashPage.routeName;
  @override
  void onInit() {
    // checkIsLoggin();
    //checkLanguage();
    super.onInit();
  }

  // checkIsLoggin() async {
  //   bool isLogin = await Singleton().isLogin();
  //   if (isLogin) {
  //     routeName = BottomBarPage.routeName;
  //     update(['routeName']);
  //   } else {
  //     routeName = SplashPage.routeName;
  //     update(['routeName']);
  //   }
  // }

  // checkLanguage() async {
  //   int indexLanguage = await Singleton().getLanguage();
  //   if (indexLanguage == 0) {
  //     LocalizationService.changeLocale("vi");
  //   } else if (indexLanguage == 1) {
  //     LocalizationService.changeLocale("en");
  //   }
  // }
}
