import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.credit_card_outlined,
        size: 50,
      ),
    );
  }
}
