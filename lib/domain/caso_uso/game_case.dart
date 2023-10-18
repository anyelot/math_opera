import 'dart:math';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:math_opera/data/local/localstorage.dart';
import 'package:math_opera/data/user_data/user_data.dart';
import 'package:math_opera/db/hive_data.dart';
import 'package:math_opera/db/some_data_db.dart';
import 'package:math_opera/domain/model_data/dataset.dart';
import 'package:math_opera/ui/controller/game_controller.dart';
import 'package:math_opera/ui/pages/content/home.dart';
import 'package:math_opera/ui/pages/content/rcontainer.dart';

class CasoDificultad {
  final HiveData hivedata = const HiveData();
  final sharedPreferences = LocalPreferences();
  late NumberController controller = Get.find();
  final stopwatch = Stopwatch();
  int _score = 0;
  int get score => _score;
  changeScore(int newscore) => _score = newscore;
  generateCase() {
    if (score <= 10) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(10));
      controller.setOperator("/");
    } else if (score <= 30) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(100));
      controller.setOperator("*");
    } else if (score <= 60) {
      controller.setOp1(Random().nextInt(1000));
      controller.setOp2(Random().nextInt(100));
      controller.setOperator("-");
    } else {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(1000));
      controller.setOperator("+");
    }
    print((controller.op1 + controller.op2).round());
  }

  updateuserafter(score) async {
    User user = User(
        id: await sharedPreferences.retrieveData("id"),
        email: await sharedPreferences.retrieveData('email'),
        password: await sharedPreferences.retrieveData('password'),
        score: score);
  
    await UserDataSource().updateUser(user);
    await hivedata.saveUser1(SomeDataDb1(id: user.id!, score: score));
    final box = Hive.box('user1');
  for (var i = 0; i < box.length; i++) {
    print('Registro $i: ${box.getAt(i)}');
  }
    
  }

  checkOperation() {
    int newScore = 0;
    switch (controller.operator) {
      case "+":
        if (controller.op1 + controller.op2 == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();
            newScore = (stopwatch.elapsed.inSeconds);
            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            updateuserafter(score);
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "*":
        if (controller.op1 * controller.op2 == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();
            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            updateuserafter(score);
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "-":
        if (controller.op1 - controller.op2 == int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();

            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            updateuserafter(score);
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "/":
        if ((controller.op1 / controller.op2).round() ==
            int.parse(controller.result)) {
          if (controller.cont < 5) {
            generateCase();
            controller.cont++;
          } else {
            stopwatch.stop();

            newScore = (stopwatch.elapsed.inSeconds);

            Get.to(HomePage(
              key: const Key('HomePage'),
            ));
            controller.cont = 0;
            changeScore(newScore);
            updateuserafter(score);
            controller.cont = 0;
            stopwatch.reset();
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      default:
        null;
    }
  }
}

class Dificultad {
  final CasoDificultad caso = Get.find();

  casegenerator() {
    caso.generateCase();
    caso.stopwatch.start();
    Get.to(const TestPage(
      key: Key('TestPage'),
    ));
  }
}
