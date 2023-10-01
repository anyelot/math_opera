import '../../ui/user_data/auth_data.dart';
import '../../ui/user_data/user_data.dart';
import '../model_data/dataset.dart';

class Repository {
  late AuthenticationDatatasource _authenticationDataSource;
  late UserDataSource _userDatatasource;
  String token = "";
  String get getToken => token;

  // BASE URL para la API /

  final String _baseUrl = '';

  Repository() {
    _authenticationDataSource = AuthenticationDatatasource();
    _userDatatasource = UserDataSource();
  }

  Future<bool> login(String email, String password) async {
    token = await _authenticationDataSource.login(_baseUrl, email, password);
    return true;
  }

  Future<bool> signUp(String email, String password, String school,
          String birthdate, String grade) async =>
      await _authenticationDataSource.signUp(
          _baseUrl, email, password, school, birthdate, grade);

  Future<bool> logOut() async => await _authenticationDataSource.logOut();

  Future<List<User>> getUsers() async => await _userDatatasource.getUsers();

  Future<bool> addUser(User user) async =>
      await _userDatatasource.addUser(user);

  Future<bool> updateUser(User user) async =>
      await _userDatatasource.updateUser(user);

  Future<bool> deleteUser(int id) async =>
      await _userDatatasource.deleteUser(id);

  Future<bool> simulateProcess() async =>
      await _userDatatasource.simulateProcess(_baseUrl, token);

  Future<bool> saveScore(Session sesion) async =>
      await _userDatatasource.saveScore(sesion);
}
