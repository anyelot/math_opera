import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/ui/pages/authentication/login.dart';
import 'package:math_opera/ui/pages/content/rcontainer.dart';

import '../../controller/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<HomePage> {
  AuthenticationController authenticationController = Get.find();
  final Map<String, String> optionsMap = {
    'Suma': '+',
    'Resta': '-',
    'Suma y Resta': '+-',
    'Multiplicación': '*',
  };
  String selectedOp = 'Suma'; // Valor inicial del ComboBox

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _logout();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Seleccione la operación', // Puedes reemplazar esto con tu lógica real
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOp,
              items: optionsMap.keys.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOp = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print(optionsMap[selectedOp]);

                Get.to(
                  () => Obx(() => authenticationController.isLogged
                      ? const PlayingPage() //EditUserPage(token:authenticationController.token)
                      : const LoginPage()),
                  arguments: optionsMap[
                      selectedOp], // Aquí pasas el nivel de dificultad
                );
              },
              child: const Text('¡Jugar!'),
            ),
          ],
        ),
      ),
    );
  }
}
