import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';
import '../routing/app_routes.dart';
import 'my_app_controller.dart';

void mainCommon() async {
  //Singleton().initial();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyLoveApp());
}

class MyLoveApp extends StatelessWidget {
  MyLoveApp({Key? key}) : super(key: key);
  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAppController>(
        id: "routeName",
        builder: (_) => GetMaterialApp(
              title: 'My Love App',
              // locale: LocalizationService.locale,
              // fallbackLocale: LocalizationService.fallbackLocale,
              // translations: LocalizationService(),
              getPages: AppRoutes.routes,
              initialRoute: myAppController.routeName,
              debugShowCheckedModeBanner: false,
            ));
  }
}
