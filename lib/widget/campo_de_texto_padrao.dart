import 'package:flutter/material.dart';

class CampoTextoPadrao extends StatelessWidget {
  final String primeiroTexto;
  final String segundoTexto;
  final IconData icone;
  final TextEditingController? textoControlador;
  final String? Function(String?)? validadorEmail;
  const CampoTextoPadrao(
      {super.key, required this.primeiroTexto, required this.segundoTexto, required this.icone, this.textoControlador, this.validadorEmail});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validadorEmail,
      controller: textoControlador,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
          labelText: primeiroTexto,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: segundoTexto,
          hintStyle: const TextStyle(color: Colors.white),
          errorStyle: const TextStyle(color: Colors.white),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 255, 0, 0)), borderRadius: BorderRadius.circular(25)),
          border: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
          prefixIcon: Icon(icone, color: Colors.white)),
    );
  }
}
