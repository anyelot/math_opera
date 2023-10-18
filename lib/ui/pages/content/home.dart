import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/data/local/localstorage.dart';
import 'package:math_opera/domain/caso_uso/game_case.dart';
import '../../controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final AuthenticationController authenticationController = Get.find();

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = LocalPreferences();
    Dificultad handler = Get.find();
    CasoDificultad casehandler = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math Operations",
            style: TextStyle(
              color: Color.fromARGB(255, 57, 24, 204),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'logout',
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: Center(
          child: ElevatedButton(
              key: const Key("TestStartButton"),
              onPressed: () async {
                //Gens base case
                var score = await sharedPreferences.retrieveData('score');
                if (score != null) {
                  casehandler.changeScore(score);
                } else {
                  casehandler.changeScore(100);
                }
                handler.casegenerator();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.blue[700],
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(30, 15, 30, 15),
                ),
              ),
              child: const Text(
                "Iniciar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ))),
    );
  }
}
