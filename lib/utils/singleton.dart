import 'package:get/get.dart';
import 'package:my_fitness_coach/page/login/login_page.dart';
import 'package:my_fitness_coach/utils/preference.dart';

import '../models/user_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  UserModel? user;
  Preferences? prefs;

  factory Singleton() {
    return _singleton;
  }
  Singleton._internal();

  initial() async {
    prefs = Preferences();
  }

  isLogin() async {
    UserModel? userReference = await prefs!.getUserPreference();
    if (userReference != null) {
      user = userReference;
      return true;
    } else {
      return false;
    }
  }

  logout() async {
    user = null;
    prefs!.clear();
    // FlutterAppBadger.removeBadge();
    // await ClearAllNotifications.clear();
    // FirebaseMessaging.instance.deleteToken();
    Get.offAll(LoginPage());
  }

  signInCompleted(UserModel userSignin) async {
    print(userSignin.firstName);
    user = userSignin;
    prefs!.setUserPreference(userSignin);
  }

  setLanguage(int index) async {
    prefs!.setlanguage(index);
  }

  getLanguage() async {
    return prefs!.getLanguage();
  }
}
