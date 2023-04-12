import 'package:flutter/material.dart';

class CampoTextoPadrao extends StatelessWidget {
  final String primeiroTexto;
  final String segundoTexto;
  final IconData icone;
  const CampoTextoPadrao({super.key, required this.primeiroTexto, required this.segundoTexto, required this.icone});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
          labelText: primeiroTexto,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: segundoTexto,
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
          prefixIcon: Icon(icone, color: Colors.white)),
    );
  }
}
