import 'package:get/get.dart';
import 'package:math_opera/ui/domain/caso_uso.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/ui/domain/user.dart';

//interfaz entre la lógica deldel juego (representada por GameUseCase) y la interfaz de usuario (UI).
class UserController extends GetxController {
  final RxList<User> _users = <User>[].obs;
  final UserUseCase userUseCase = Get.find();

  List<User> get users => _users;

  @override
  void onInit() {
    getUers();
    super.onInit();
  }

  getUers() async {
    logInfo("Getting users");
    _users.value = await userUseCase.getUsers();
  }

  addUser(User user) async {
    logInfo("Add user");
    await userUseCase.addUser(user);
    getUers();
  }

  updateUser(User user) async {
    logInfo("Update user");
    await userUseCase.updateUser(user);
    getUers();
  }

  void deleteUser(int id) async {
    await userUseCase.deleteUser(id);
    getUers();
  }

  void simulateProcess() async {
    await userUseCase.simulateProcess();
  }
}
