import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_opera/domain/caso_uso/game_case.dart';
import 'package:math_opera/ui/controller/game_controller.dart';
import 'package:math_opera/ui/pages/content/detail.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPagestate();
}

class _TestPagestate extends State<TestPage> {
  late final TextEditingController numberPad;
  NumberController controller = Get.find();
  CasoDificultad casehandler = Get.find();

  @override
  void initState() {
    super.initState();
    numberPad = TextEditingController();
  }

  @override
  void dispose() {
    numberPad.dispose();
    super.dispose();
  }

  void inputNumber(int value) {
    numberPad.text += value.toString();
    controller.resetResult();
    controller.setResult(numberPad.text);
  }

  void clearLastInput() {
    if (numberPad.text.isNotEmpty) {
      numberPad.text = numberPad.text.substring(
        0,
        numberPad.text.length - 1,
      );
    }
  }

  Dificultad handler = Get.find();
  void sendInput() {
    casehandler.checkOperation();
    controller.resetResult();
    clearAll();
  }

  void clearAll() {
    numberPad.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: SizedBox(
                    child: Row(
                  children: [
                    Expanded(
                        child: Obx(() => Text(controller.op1.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 50)))),
                    Expanded(
                        child: Obx(() => Text(controller.operator.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 50)))),
                    Expanded(
                        child: Obx(() => Text(controller.op2.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 50)))),
                  ],
                ))),
          )),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: numberPad,
                  autofocus: true,
                  showCursor: true,
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: KeyPad(
              onInputNumber: inputNumber,
              onClearLastInput: clearLastInput,
              onClearAll: clearAll,
              sendInput: sendInput,
            ),
          ),
        ],
      ),
    );
  }
}
