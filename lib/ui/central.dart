import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_opera/ui/controller/auth_controller.dart';
import 'package:math_opera/ui/pages/authentication/login.dart';
import 'package:math_opera/ui/pages/content/home.dart';

class Central extends StatelessWidget {
  const Central({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return Obx(() => authenticationController.isLogged
        ? const HomePage() //EditUserPage(token:authenticationController.token)
        : const LoginPage());
  }
}
