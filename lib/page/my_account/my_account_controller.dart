import 'package:get/get.dart';
import 'package:my_fitness_coach/utils/singleton.dart';

import '../../models/user_model.dart';

class MyAccountController extends GetxController {
  UserModel user = UserModel();
  @override
  void onInit() {
    user = Singleton().user!;
    if (user != null) {
      // getUserProfile();
    }
    super.onInit();
  }

  // getUserProfile() async {
  //   await UserRepository.getUserProfileFull(user.id.toString(), (callBack) {
  //     ProfileModel data = ProfileModel.fromJson(callBack);
  //     profile = data;
  //     update(["updateUserProfile"]);
  //   });
  // }
}
