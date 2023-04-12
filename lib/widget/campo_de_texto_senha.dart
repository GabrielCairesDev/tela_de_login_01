import 'package:flutter/material.dart';

class CamporDeTextoSenha extends StatefulWidget {
  final String senha;
  final String senhaTexto;
  const CamporDeTextoSenha({super.key, required this.senha, required this.senhaTexto});

  @override
  State<CamporDeTextoSenha> createState() => _CaixaDeSenhaState();
}

class _CaixaDeSenhaState extends State<CamporDeTextoSenha> {
  bool senhaVisivel = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: senhaVisivel,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.white), borderRadius: BorderRadius.circular(25)),
        labelText: widget.senha,
        hintText: widget.senhaTexto,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
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
