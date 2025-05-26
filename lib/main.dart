import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

// finished section 12 finished  #130


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
  int height = 180;

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
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;});
                      },
                      colour: selectedGender == Gender.male
                          ? const Color(kactiveCardColor)
                          : const Color(kinactiveCardColor),
                      cardChild: IconContent(
                        iconType: Icons.male,
                        labelText: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;});
                      },
                      colour: selectedGender == Gender.female
                          ? const Color(kactiveCardColor)
                          : const Color(kinactiveCardColor),
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
                colour: const Color(kactiveCardColor),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                          style: kfontsize
                        ),
                        Text('cm',style: klabelTextStyle)
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      label: '$height',
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print (newValue);
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(kactiveCardColor),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(kactiveCardColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(kbottomContainerColor),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kbottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}
