import 'dart:math';

import 'package:loggy/loggy.dart';
import 'package:math_opera/ui/domain/user.dart';
import 'package:math_opera/ui/user_data/auth_data.dart';
import 'package:math_opera/ui/user_data/user_data.dart';

//Lógica del juego
class GameRepository {
  late MathProblem _currentProblem;
  List<MathAnswer> mathAnswers = [];

  final _random = Random();

  GameRepository() {
    _currentProblem = _generateRandomProblem();
  }

  Future<MathProblem> generateProblem() async {
    _currentProblem = _generateRandomProblem();
    return _currentProblem;
  }

  Future<bool> verifyAnswer(int answer, Duration timeTaken) async {
    bool isCorrect = answer == _currentProblem.answer;
    mathAnswers.add(MathAnswer(_currentProblem, timeTaken, isCorrect));
    return isCorrect;
  }

  Future<int> getAnswer() async {
    return _currentProblem.answer;
  }

  Future<void> clearAnswers() async {
    mathAnswers = [];
  }

  Future<List<MathAnswer>> getAnswers() async {
    return mathAnswers;
  }

  MathProblem _generateRandomProblem() {
    var num1 = _random.nextInt(10);
    var num2 = _random.nextInt(10);
    var ops = ["+"];
    var op = ops[_random.nextInt(ops.length)];
    int answer;
    switch (op) {
      case "+":
        answer = num1 + num2;
        break;
      /*case "-":
        if (num1 < num2) {
          [num1, num2] = [num2, num1];
          logInfo("swap");
        }
        answer = num1 - num2;
        break;
      case "*":
        answer = num1 * num2;
        break;*/
      default:
        throw Exception("Unknown operation");
    }

    return MathProblem(num1, num2, op, answer);
  }
}

//la autenticación de usuarios y la gestión de datos de usuarios.
class MathProblem {
  final int num1, num2, answer;
  final String op;

  MathProblem(this.num1, this.num2, this.op, this.answer);

  @override
  String toString() {
    return "$num1 $op $num2 = ";
  }
}

class MathAnswer {
  final MathProblem mathProblem;
  final Duration duration;
  final bool isCorrect;

  MathAnswer(this.mathProblem, this.duration, this.isCorrect);
}

class Repository {
  late AuthenticationDatatasource _authenticationDataSource;
  late UserDataSource _userDatatasource;
  String token = "";

  // the base url of the API should end without the /
  final String _baseUrl =
      "https://felipe27th.retool.com/apps/c9db5c48-5d54-11ee-8283-b3ca0a13aa32/Title%20your%20first%20app";

  Repository() {
    _authenticationDataSource = AuthenticationDatatasource();
    _userDatatasource = UserDataSource();
  }

  Future<bool> login(String email, String password) async {
    token = await _authenticationDataSource.login(_baseUrl, email, password);
    return true;
  }

  Future<bool> signUp(String email, String password) async =>
      await _authenticationDataSource.signUp(_baseUrl, email, password);

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
}
