import 'package:flutter/material.dart';

class CampoDeTextoSenha extends StatefulWidget {
  final String senha;
  final String senhaTexto;
  final TextEditingController? textoControlador;
  final String? Function(String?)? validadorSenha;
  const CampoDeTextoSenha({super.key, required this.senha, required this.senhaTexto, this.textoControlador, this.validadorSenha});

  @override
  State<CampoDeTextoSenha> createState() => _CaixaDeSenhaState();
}

class _CaixaDeSenhaState extends State<CampoDeTextoSenha> {
  bool senhaVisivel = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validadorSenha,
      controller: widget.textoControlador,
      obscureText: senhaVisivel,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
        labelText: widget.senha,
        hintText: widget.senhaTexto,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(color: Colors.white),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 255, 0, 0)), borderRadius: BorderRadius.circular(25)),
        border: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: InkWell(
          child: Icon(Icons.visibility, color: senhaVisivel ? Colors.white : Colors.grey),
          onTap: () {
            setState(() => senhaVisivel = !senhaVisivel);
          },
        ),
      ),
    );
  }
}
