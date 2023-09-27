import 'package:loggy/loggy.dart';
import 'package:math_opera/ui/domain/repositorie.dart';
import 'package:get/get.dart';
import 'package:math_opera/ui/domain/user.dart';

class AuthenticationUseCase {
  final Repository _repository = Get.find();

  Future<bool> login(String email, String password) async =>
      await _repository.login(email, password);

  Future<bool> signUp(String email, String password) async =>
      await _repository.signUp(email, password);

  Future<bool> logOut() async => await _repository.logOut();
}

class GameUseCase {
  final GameRepository _gameRepository;
  GameUseCase(this._gameRepository);

  Future<MathProblem> generateProblem() async =>
      await _gameRepository.generateProblem();

  Future<bool> verifyAnswer(int answer, Duration timeTaken) async {
    return await _gameRepository.verifyAnswer(answer, timeTaken);
  }

  Future<int> getAnswer() async {
    return await _gameRepository.getAnswer();
  }

  Future<void> clearAnswers() async {
    return await _gameRepository.clearAnswers();
  }

  Future<List<MathAnswer>> getAnswers() async {
    return await _gameRepository.getAnswers();
  }
}

class UserUseCase {
  final Repository _repository = Get.find();

  UserUseCase();

  Future<List<User>> getUsers() async {
    logInfo("Getting users  from UseCase");
    return await _repository.getUsers();
  }

  Future<void> addUser(User user) async => await _repository.addUser(user);

  Future<void> updateUser(User user) async =>
      await _repository.updateUser(user);

  deleteUser(int id) async => await _repository.deleteUser(id);

  simulateProcess() async => await _repository.simulateProcess();
}
