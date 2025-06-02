import 'package:flutter/material.dart';
import 'constants.dart';
//import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResults, @required this.resultText, @required this.interpretation});

   String?  bmiResults = 'undefine';
   String?  resultText = 'undefine';
  String?  interpretation = 'undefine';


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
                resultText!,
              style: kTitleTextStyle,
            ),
           Text(
             bmiResults!,
             style: kResultsTextStyle,
           ),
            Text(
              interpretation!,
              textAlign: TextAlign.center,
              style: kBMITextStyle,
            ),
           /* Text(
              'Your BMI result is quite low, you should eat more',
              textAlign: TextAlign.center,
              style: kBodyTextStyle,
            ),*/
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
