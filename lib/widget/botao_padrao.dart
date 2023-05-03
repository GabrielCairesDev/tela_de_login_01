
import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  final String textoBotao;
  final Function()? onPressed;
  const BotaoPadrao({super.key, required this.textoBotao, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 234, 77, 114),
          fixedSize: const Size(500, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: onPressed,
      child: Text(textoBotao, style: const TextStyle(fontSize: 20)),
    );
  }
}
