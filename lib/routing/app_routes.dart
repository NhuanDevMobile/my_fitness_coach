import 'package:get/get.dart';
import 'package:my_fitness_coach/page/bottom_bar/bottom_bar_page.dart';

import '../page/splash/splash_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: SplashPage.routeName,
      page: () => SplashPage(),
    ),
    GetPage(
      name: BottomBarPage.routeName,
      page: () => BottomBarPage(),
    ),
  ];
}
