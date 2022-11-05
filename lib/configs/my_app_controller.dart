import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../page/bottom_bar/bottom_bar_page.dart';
import '../page/splash/splash_page.dart';
import '../utils/singleton.dart';

class MyAppController extends GetxController {
  String routeName = SplashPage.routeName;
  var connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription streamSubscription;
  final globalNavigatorKey = GlobalKey<NavigatorState>();
  @override
  void onInit() {
    checkIsLoggin();
    getConnectivityType();
    streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    //checkLanguage();
    super.onInit();
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        break;
      default:
        //showSnackBar(title: 'Error', message: 'Failed to get connection type');
        break;
    }
  }

  checkIsLoggin() async {
    bool isLogin = await Singleton().isLogin();
    if (isLogin) {
      routeName = BottomBarPage.routeName;
      update(['routeName']);
    } else {
      routeName = SplashPage.routeName;
      update(['routeName']);
    }
  }

  // checkLanguage() async {
  //   int indexLanguage = await Singleton().getLanguage();
  //   if (indexLanguage == 0) {
  //     LocalizationService.changeLocale("vi");
  //   } else if (indexLanguage == 1) {
  //     LocalizationService.changeLocale("en");
  //   }
  // }
}
