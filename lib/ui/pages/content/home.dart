import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../authentication/login.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.loggedUser}) : super(key: key);
  final String loggedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operaciones"),
        actions: [
          IconButton(
              key: const Key('ButtonHomeLogOff'),
              onPressed: () {
                Get.off(() => LoginScreen(
                      key: const Key('LoginScreen'),
                      user: loggedUser,
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(key: const Key('TextHomeHello'), "Bienvenido $loggedUser"),
            ElevatedButton(
                key: const Key('ButtonHomeDetail'),
                onPressed: () {
                  Get.to(() => const DetailPage(
                        key: Key('DetailPage'),
                      ));
                },
                child: const Text("Inicio")),
          ],
        ),
      ),
    );
  }
}
