import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
//start section  126


const bottomContainerHeight = 80.0;
const cardBackgroundColor = 0xFF1D1E33;
const bottomContainerColor = 0xFFEB1555;

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(cardBackgroundColor),
                      cardChild: IconContent(
                        iconType: Icons.male,
                        labelText: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(cardBackgroundColor),
                      cardChild: IconContent(
                        iconType: Icons.female,
                        labelText: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseCard(
                colour: const Color(cardBackgroundColor),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(cardBackgroundColor),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(cardBackgroundColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(bottomContainerColor),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}



