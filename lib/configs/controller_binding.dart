import 'package:get/get.dart';
import 'package:my_fitness_coach/configs/my_app_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppController>(() => MyAppController());
  }
}
