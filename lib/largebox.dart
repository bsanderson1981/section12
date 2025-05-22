import 'package:flutter/material.dart';

class LargeBox extends StatelessWidget {
  final Widget? child;
  final String? label;

  const LargeBox({this.child, this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: 360.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (child != null) child!,
          if (label != null)
            SizedBox(height: 10),
          if (label != null)
            Text(
              label!,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
        ],
      ),
    );
  }
}
