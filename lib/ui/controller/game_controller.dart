import 'package:get/get.dart';

class NumberController extends GetxController {
  final _op1 = 0.obs;
  final _op2 = 0.obs;
  final _operator = "+".obs;
  final _result = "".obs;
  int cont = 0;

  int get op1 => _op1.value;
  int get op2 => _op2.value;
  String get operator => _operator.value;
  String get result => _result.value;

  setOp1(newValue) => _op1.value = newValue;
  setOp2(newValue) => _op2.value = newValue;
  setOperator(newValue) => _operator.value = newValue;
  resetResult() => _result.value = "";
  setResult(newValue) => _result.value = _result + newValue;
  goback() {
    if (_result.toString().isNotEmpty) {
      _result.value = _result.value.substring(0, _result.value.length - 1);
    } else {
      null;
    }
  }
}
