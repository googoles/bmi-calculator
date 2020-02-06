import 'dart:math';

class Calculat_bmi {

  Calculat_bmi({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {

    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }

  String getResult() {

    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {

    if (_bmi >= 25) {
      return "그만좀 먹어";
    } else if (_bmi > 18.5) {
      return '적당하네';
    } else {
      return "좀 먹어라";
    }

  }

}