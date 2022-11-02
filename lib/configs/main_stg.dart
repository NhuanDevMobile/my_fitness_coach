import 'package:get_storage/get_storage.dart';
import 'package:global_configs/global_configs.dart';
import 'configurations.dart' as configurations;
import 'my_app.dart';

void main() async {
  await GetStorage.init().then((completed) async {
    GlobalConfigs().loadFromMap(configurations.stg);
    mainCommon();
  });
}
