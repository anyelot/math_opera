import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/domain/caso_uso/auth_case.dart';
import 'package:math_opera/domain/caso_uso/user_case.dart';
import 'package:math_opera/domain/repositories/repository.dart';
import 'package:math_opera/ui/central.dart';
import 'package:math_opera/ui/controller/auth_controller.dart';
import 'package:math_opera/ui/controller/game_controller.dart';
import 'package:math_opera/ui/controller/user_controller.dart';
import 'package:math_opera/ui/domain/caso_uso/game_case.dart';

void main() {
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
      home: const Home(),
    );
  }
}
