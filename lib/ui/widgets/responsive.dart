import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_opera/domain/caso_uso/game_case.dart';
import 'package:math_opera/ui/controller/game_controller.dart';
import 'package:math_opera/ui/pages/content/game.dart';

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
  int cont = 0;
  void sendInput() {
    if (cont <= 5) {
      if (controller.result != "") {
        casehandler.checkOperation();
        cont++;
      } else {
        //controller.setinfotext("You have to write something...");
      }
      controller.resetResult();
      clearAll();
    } else {
      cont = 0;
      Get.offNamed("/HomePage");
    }
  }

  void clearAll() {
    numberPad.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          const Expanded(
              child: Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: Text("Puntaje = "),
              ),
              /*Expanded(
                  child: Obx(() => const Text("",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )))),*/
              SizedBox(
                width: 150,
              ),
              Expanded(
                child: Text("Dificultad ="),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          )),
          Expanded(
              child: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                    child: Row(
                  children: [
                    const SizedBox(
                      width: 150,
                    ),
                    Expanded(
                        child: Obx(
                      () => Text(controller.op1.toString(),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    )),
                    Expanded(
                        child: Obx(() => Text(controller.operator.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )))),
                    Expanded(
                        child: Obx(() => Text(controller.op2.toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )))),
                    const SizedBox(
                      width: 150,
                    ),
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
