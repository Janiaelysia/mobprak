import 'package:flutter/material.dart';

class BmiModel extends ChangeNotifier{
  double height;
  double weight;
  double bmi;
  String result;

  BmiModel({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.result
  });

  toJson() => {
    'height': height,
    'weight': weight,
    'bmi': bmi,
    'result': result
  };


}