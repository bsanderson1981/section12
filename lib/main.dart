import 'package:flutter/material.dart';
//import 'smallbox.dart';
//import 'largebox.dart';
// start section 12 #123
void main() => runApp(BMICalculator());

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
                    child: ReuseCard(colour: Color(0xFF1D1E33),)
                  ),
                  Expanded(
                    child: ReuseCard(colour: Color(0xFF1D1E33),
                    )
                  ),
                ],
              ),
            ),
            //middle box on screen
            Expanded(child: ReuseCard(colour: Color(0xFF1D1E33)),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:ReuseCard(colour: Color(0xFF1D1E33))
                  ),
                  Expanded(
                    child: ReuseCard(colour: Color(0xFF1D1E33))
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReuseCard extends StatelessWidget {

  final Color colour;
  ReuseCard({required this.colour});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0XFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
