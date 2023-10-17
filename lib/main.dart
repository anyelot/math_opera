import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/data/user_data/user_data.dart';
import 'package:math_opera/db/some_data_1_db.dart';
import 'package:math_opera/db/some_data_db.dart';
import 'package:math_opera/domain/caso_uso/auth_case.dart';
import 'package:math_opera/domain/caso_uso/game_case.dart';
import 'package:math_opera/domain/caso_uso/user_case.dart';
import 'package:math_opera/domain/repositories/repository.dart';
import 'package:math_opera/ui/controller/auth_controller.dart';
import 'package:math_opera/ui/controller/game_controller.dart';
import 'package:math_opera/ui/pages/authentication/login.dart';
import 'package:math_opera/ui/pages/content/home.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(SomeDataDb2Adapter());
  Hive.registerAdapter(SomeDataDb1Adapter());
  boxList.add(await Hive.openBox('someData'));
  return boxList;
}

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(UserDataSource());
  Get.put(Repository());
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(AuthenticationController());
  Get.put(CasoDificultad());
  Get.put(NumberController());
  Get.put(Dificultad());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return GetMaterialApp(
        title: 'Math App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Obx(() => authenticationController.isLogged
            ? HomePage()
            : const LoginPage()));
  }
}
