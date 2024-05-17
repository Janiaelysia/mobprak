double bmicalculate(double height, double weight) {
  //Count BMI

  double bmi = weight / ((height) / 100 * (height) / 100);
  print(bmi);
  bmi = double.parse(bmi.toStringAsFixed(2));
  return bmi;
}

String bmiResult(double bmi) {
  //Return BMI result
  if (bmi >= 25) {
    return 'You are Overweight, consider exercising more!';
  } else if (bmi > 18.5) {
    return 'You have a normal body weight, Good job!';
  } else {
    return 'You are underweight, consider eating more!';
  }
}
