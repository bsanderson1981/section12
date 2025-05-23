import 'package:flutter/material.dart';

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