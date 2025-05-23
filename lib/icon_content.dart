import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconType;
  final String labelText;

  const IconContent({
    required this.iconType,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconType, size: 140, color: Colors.white),
        const SizedBox(height: 15),
        Text(
          labelText,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}