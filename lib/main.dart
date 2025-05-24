import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
// finished section 12 finished  #127

const bottomContainerHeight = 80.0;
const activeCardColor = 0xFF1D1E33;
const inactiveCardColor = 0xFF111328;
const bottomContainerColor = 0xFFEB1555;

enum Gender {
  male,
  female,
}

void main() => runApp(const BMICalculator());

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender? selectedGender;

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
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReuseCard(
                        colour: selectedGender == Gender.male
                            ? const Color(activeCardColor)
                            : const Color(inactiveCardColor),
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
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReuseCard(
                        colour: selectedGender == Gender.female
                            ? const Color(activeCardColor)
                            : const Color(inactiveCardColor),
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
