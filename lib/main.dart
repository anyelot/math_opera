import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/db/some_data_db.dart';
import 'package:math_opera/domain/caso_uso/auth_case.dart';
import 'package:math_opera/domain/caso_uso/game_case.dart';
import 'package:math_opera/domain/caso_uso/user_case.dart';
import 'package:math_opera/domain/repositories/repository.dart';
import 'package:math_opera/inter/keyboard.dart';
import 'package:math_opera/ui/central.dart';
import 'package:math_opera/ui/controller/auth_controller.dart';
import 'package:math_opera/ui/controller/game_controller.dart';
import 'package:math_opera/ui/controller/user_controller.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(SomeDataDbAdapter());
  boxList.add(await Hive.openBox('someData'));
  return boxList;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _openBox();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  Get.put(Repository());
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(AuthenticationController());
  Get.put(UserController());
  Get.put(CalculatorUseCase());
  Get.put(CalculatorController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Math_Opera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: const HomePage(),
=======
      home: const Central(),
>>>>>>> 1a7a2773af93c652450b4ac95cf123a4f1807374
    );
  }
}
