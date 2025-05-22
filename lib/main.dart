import 'package:flutter/material.dart';
//import 'smallbox.dart';
//import 'largebox.dart';

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
                    child: ReuseableCard()
                  ),
                  Expanded(
                    child: ReuseableCard()
                  ),
                ],
              ),
            ),
            //middle box on screen
            Expanded(child: ReuseableCard(),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:ReuseableCard()
                  ),
                  Expanded(
                    child: ReuseableCard()
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

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    super.key,
  });

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
