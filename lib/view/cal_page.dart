import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.calculate,
        size: 50,
      ),
    );
  }
}
