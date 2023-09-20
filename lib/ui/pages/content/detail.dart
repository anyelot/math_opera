import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_opera/inter/keyboard.dart';
import 'package:math_opera/ui/pages/content/rcontainer.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  //AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      appBar: AppBar(
        title: const Text('Math_Opera'),
        actions: [
          IconButton(
            key: const Key("home_page_retun_button"),
            onPressed: () async {
              //await authenticationController.logOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      children: [
        FilledButton(
          key: const Key("home_page_play_button"),
          onPressed: () {
            Get.to(() => MyKeyboard());
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.blue,
            ),
            padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(
              30,
              15,
              30,
              15,
            )),
          ),
          child: const Text(
            "Iniciar",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
