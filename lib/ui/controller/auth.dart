import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/ui/domain/caso_uso.dart';

//Gestión de la autenticación de usuarios
class AuthenticationController extends GetxController {
  final logged = false.obs;

  bool get isLogged => logged.value;

  Future<void> login(user, password) async {
    final AuthenticationUseCase authentication = Get.find();
    await authentication.login(user, password);
    logged.value = true;
  }

  Future<bool> signUp(user, password) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    await authentication.signUp(user, password);
    return true;
  }

  Future<void> logOut() async {
    logged.value = false;
  }
}
