
import 'package:bmi_project/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Body Mass Index'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1ExpandedWidget(context, 'male'),
                    SizedBox(
                      width: 20,
                    ),
                    m1ExpandedWidget(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.headline2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1),
                          Text('CM',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      Slider(
                        onChanged: (newValue) {
                          setState(() {
                            heightVal = newValue;
                          });
                        },
                        value: heightVal,
                        min: 0,
                        max: 250,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    m2ExpandedWidget(context, 'weight'),
                    SizedBox(
                      width: 20,
                    ),
                    m2ExpandedWidget(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 9,
              color: Colors.blueGrey,
              child: TextButton(
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline1,
                ),
                onPressed: () {
                  var result =
                      (weight / pow(heightVal / 100, 2)).toStringAsFixed(1);

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Result(
                        result: double.parse(result), isMale: isMale, age: age),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1ExpandedWidget(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2ExpandedWidget(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'weight' ? 'Weight' : 'Age',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              type == 'weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  heroTag: type == 'weight' ? 'weight--' : 'age--',
                  onPressed: () {
                    setState(() {
                      type == 'weight' ? weight-- : age--;
                    });
                  },
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  heroTag: type == 'weight' ? 'weight++' : 'age++',
                  onPressed: () {
                    setState(() {
                      type == 'weight' ? weight++ : age++;
                    });
                  },
                  child: Icon(Icons.add),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
