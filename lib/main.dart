import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

// finished section 12 finished  #131

enum Gender { male, female }

void main() => runApp(const BMICalculator());

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 70;

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
        appBar: AppBar(centerTitle: true, title: const Text('BMI CALCULATOR')),
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
                      colour:
                      selectedGender == Gender.male
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
                      colour:
                      selectedGender == Gender.female
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
                        Text(height.toString(), style: kfontsize),
                        Text('cm', style: klabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 24.0,
                        ),
                        thumbColor: Colors.red,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        overlayColor: Colors.red, // fully opaque red
                      ),

                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Colors.white, had to turn off made ball red
                        //inactiveColor: Colors.grey,  ditto ditto
                        label: '$height',
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
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
                      child: ReuseCard(colour: Color(kactiveCardColor
                      ),
                          cardChild:
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Weight', style: klabelTextStyle,),
                                Text(weight.toString(),
                                    style: kfontsize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(icon: FontAwesomeIcons.plus),
                                    /*FloatingActionButton(
                              onPressed: () {
                                // your action here
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(Icons.add, color: Colors.white,),
                            ),*/
                                    SizedBox(width: 10,),
                                    RoundIconButton(icon: FontAwesomeIcons.minus),
                                    /*FloatingActionButton(
                              onPressed: () {
                                // your action here
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(Icons.add, color: Colors.white,),
                            ),*/
                                  ],
                                )

                              ]
                          )
                      )),
                  Expanded(
                      child: ReuseCard(colour: Color(kactiveCardColor),
                          cardChild:
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Age', style: klabelTextStyle),
                                Text(age.toString(),
                                    style: kfontsize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(icon: FontAwesomeIcons.plus),
                                    SizedBox(width: 10,),
                                    RoundIconButton(icon: FontAwesomeIcons.minus),
                                  ],
                                )

                              ]
                          )
                      )),
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

class RoundIconButton extends StatelessWidget {
//  const RoundIconButton({super.key});
  RoundIconButton({this.icon});

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon, color: Colors.white),
      onPressed: () {},
      constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

