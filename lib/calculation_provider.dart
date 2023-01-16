import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculation extends ChangeNotifier {
  var _userInput = '';
  get userInput => _userInput;

  var _result = '0';
  get result => _result;

  void numberChange(String number) {
    _userInput = _userInput + number;
    _result = '0';
    notifyListeners();
  }

  void numberClear() {
    _userInput = '';
    _result = '0';
    notifyListeners();
  }

  void numberDelete() {
    _result = '';
    _userInput = _userInput.substring(0, _userInput.length - 1);
    notifyListeners();
  }

  void equalPressed() {
    String finaluserinput = _userInput;
    finaluserinput = _userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _result = eval.toString();
    _userInput = _result;
    notifyListeners();
  }
}
