import 'package:flutter/material.dart';
//22
class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Inside ResultsPage');
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: const Center(
        child: Text(
          'This is the results page',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}

