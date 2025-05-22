import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.mars, size: 80, color: Colors.white),
                          SizedBox(height: 15),
                          Text('MALE', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      colour: const Color(cardBackgroundColor),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.venus, size: 80, color: Colors.white),
                          SizedBox(height: 15),
                          Text('FEMALE', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
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
                    child: ReuseCard(colour: const Color(cardBackgroundColor)),
                  ),
                  Expanded(
                    child: ReuseCard(colour: const Color(cardBackgroundColor)),
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

class ReuseCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;

  const ReuseCard({required this.colour, this.cardChild, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
