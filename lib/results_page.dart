import 'package:flutter/material.dart';
import 'constants.dart';
//import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.black, // 👈 Page background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white, // 👈 AppBar text color
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white, // 👈 Default body text
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Results',
              style: kTitleTextStyle,
            ),
           Text(
             'Normal',
             style: kResultsTextStyle,
           ),
            Text(
              '18.3',
              style: kBMITextStyle,
            ),
            Text(
              'Your BMI result is quite low, you should eat more',
              textAlign: TextAlign.center,
              style: kBodyTextStyle,
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context); // Or any logic
              },
              buttonTitle: 'RE-CALCULATE',
            ),

          ],
        ),
      ),
    );
  }
}
