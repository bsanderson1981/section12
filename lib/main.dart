import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
//finished #135  did not to all refactors widgets she did
enum Gender { male, female }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender? selectedGender;
  int defaultheight = 68; // inches
  int defaultweight = 150; // starting display weight
  int age = 65; // starting display age

  void updateWeight(String direction) {
    final weightHelper =
    WeightButton(weight: defaultweight, plusminus: direction);
    setState(() {
      defaultweight = weightHelper.adjustWeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
      AppBar(centerTitle: true, title: const Text('BMI CALCULATOR')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
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
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
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
                  Center(child: Text('HEIGHT', style: klabelTextStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(defaultheight.toString(), style: kfontsize),
                      Text('in', style: klabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 24.0),
                      thumbColor: Colors.red,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Colors.red,
                    ),
                    child: Slider(
                      value: defaultheight.toDouble(),
                      min: 48.0,
                      max: 84.0,
                      label: '$defaultheight',
                      onChanged: (double newValue) {
                        setState(() {
                          defaultheight = newValue.round();
                        });
                      },
                    ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight', style: klabelTextStyle),
                        Text(defaultweight.toString(), style: kfontsize),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => updateWeight('plus'),
                            ),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => updateWeight('minus'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    colour: const Color(kactiveCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age', style: klabelTextStyle),
                        Text(age.toString(), style: kfontsize),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CACULATE',onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ResultsPage()));

          }, ),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon, color: Colors.white),
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(height: 56.0, width: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}

class WeightButton {
  final int weight;
  final String plusminus;

  WeightButton({required this.weight, required this.plusminus});

  int adjustWeight() {
    const int min = 85;
    const int max = 350;
    if (plusminus == 'plus' && weight < max) {
      return weight + 1;
    } else if (plusminus == 'minus' && weight > min) {
      return weight - 1;
    }
    return weight;
  }
}