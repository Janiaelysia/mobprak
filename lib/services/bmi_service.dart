import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bmi_model.dart';

class Bmiprovider extends StateNotifier<List<BmiModel>> {
  Bmiprovider() : super([BmiModel(height: 0, weight: 0, bmi: 0, result: "")]);

  void addRecord(double height, double weight) {
    double bmi = weight / ((height) / 100 * (height) / 100);
    bmi = double.parse(bmi.toStringAsFixed(2));
    String result;
    if (bmi >= 25) {
      result = 'You are Overweight, consider exercising more!';
    } else if (bmi > 18.5) {
      result = 'You have a normal body weight, Good job!';
    } else {
      result = 'You are underweight, consider eating more!';
    }
    state = [
      BmiModel(height: height, weight: weight, bmi: bmi, result: result),
      ...state
    ];
  }
}

final bmiprovider = StateNotifierProvider<Bmiprovider, List<BmiModel>>((ref) {
  return Bmiprovider();
});
