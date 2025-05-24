import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = 0xFF1D1E33;
const inactiveCardColor = 0xFF111328;
const bottomContainerColor = 0xFFEB1555;

void main() => runApp(const BMICalculator());

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Color malecardColor = const Color(inactiveCardColor);
  Color femalecardColor = const Color(inactiveCardColor);

  void updateColor(int gender) {
    //MALE
    if (gender == 1) {
      malecardColor = malecardColor == const Color(inactiveCardColor)
          ? const Color(activeCardColor)
          : const Color(inactiveCardColor);
      femalecardColor = const Color(inactiveCardColor); // unselect female
    } else
      //FEMALE
      if (gender == 2) {
      femalecardColor = femalecardColor == const Color(inactiveCardColor)
          ? const Color(activeCardColor)
          : const Color(inactiveCardColor);
      malecardColor = const Color(inactiveCardColor); // unselect male
    }
  }

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: ReuseCard(
                        colour: malecardColor,
                        cardChild: IconContent(
                          iconType: Icons.male,
                          labelText: "MALE",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReuseCard(
                        colour: femalecardColor,
                        cardChild: IconContent(
                          iconType: Icons.female,
                          labelText: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseCard(
                colour: const Color(activeCardColor),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(activeCardColor),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(activeCardColor),
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
