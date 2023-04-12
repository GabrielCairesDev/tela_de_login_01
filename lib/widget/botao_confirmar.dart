import 'package:flutter/material.dart';

class BotaoEntrar extends StatelessWidget {
  final String textoBotao;
  const BotaoEntrar({super.key, required this.textoBotao});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 234, 77, 114),
          fixedSize: const Size(500, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {},
      child: Text(textoBotao, style: const TextStyle(fontSize: 20)),
    );
  }
}
