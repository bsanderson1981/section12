
import 'dart:math';

class CalculatorBrain {
    CalculatorBrain({required this.weight, required this.height});

  final int weight;
  final int height;
  double _bmi =0.0;

  String calculateBMI() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getResults() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  getInterpritation() {
    if (_bmi >= 25) {
      return "Walk 10,000 steps a day";
    } else if (_bmi > 18.5) {
      return 'Keep up the good worK';
    } else
      return 'Eat more protein';


  }
}
