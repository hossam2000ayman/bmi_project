import 'package:flutter/material.dart';
import 'package:bmi_project/result.dart';

class Result extends StatelessWidget {
  Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'OverWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Title Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Gender : ${isMale ? 'Male' : 'Female'}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                "Result : ${result.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                "Healthiness : ${resultPhrase}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                "Age : ${age}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
