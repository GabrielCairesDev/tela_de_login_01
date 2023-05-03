import 'package:flutter/material.dart';

class PlanoDeFundo extends StatelessWidget {
  const PlanoDeFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromRGBO(31, 0, 92, 1.000),
            Color.fromRGBO(91, 0, 96, 1.000),
            Color.fromRGBO(135, 1, 96, 1.000),
            Color.fromRGBO(172, 37, 94, 1.000),
            Color.fromRGBO(202, 72, 92, 1.000),
            Color.fromRGBO(225, 107, 92, 1.000),
            Color.fromRGBO(243, 144, 96, 1.000),
            Color.fromRGBO(255, 181, 107, 1.000),
          ],
        ),
      ),
    );
  }
}
