import 'package:get/get.dart';
import 'package:math_opera/data/local/localstorage.dart';
import 'package:math_opera/data/user_data/user_data.dart';

class AuthenticationUseCase {
  final sharedPreferences = LocalPreferences();
  final UserDataSource dBdata = Get.find();

  Future<bool> login(String email, String password) async {
    var user = await dBdata.getUserbyquery(email);
    print(user.id);
    if (user.password == password) {
      sharedPreferences.storeData("email", user.email);
      sharedPreferences.storeData("password", user.password);
      sharedPreferences.storeData<int>("id", user.id as int);
      sharedPreferences.storeData("score", user.score);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(form) async {
    if (await dBdata.addUser(form)) {
      print('user created');
      print('saving local values');
      return true;
    } else {
      return false;
    }
  }
}
