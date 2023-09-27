import 'package:math_opera/ui/domain/caso_uso.dart';
import 'package:math_opera/ui/domain/repositorie.dart';

class GameController {
  final GameUseCase _gameUseCase;
  GameController(this._gameUseCase);

  Future<MathProblem> generateProblem() async =>
      await _gameUseCase.generateProblem();

  Future<bool> verifyAnswer(int answer, Duration timeTaken) async {
    return await _gameUseCase.verifyAnswer(answer, timeTaken);
  }

  Future<int> getAnswer() async {
    return await _gameUseCase.getAnswer();
  }

  Future<void> clearAnswers() async {
    return await _gameUseCase.clearAnswers();
  }

  Future<List<MathAnswer>> getAnswers() async {
    return await _gameUseCase.getAnswers();
  }
}
