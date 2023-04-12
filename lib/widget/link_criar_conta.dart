import 'package:flutter/material.dart';
import 'package:tela_de_login_01/rotas/rotas.dart';

class LinkCriarConta extends StatelessWidget {
  final String textoCriarConta;
  const LinkCriarConta({super.key, required this.textoCriarConta});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(textoCriarConta, style: const TextStyle(color: Colors.white, fontSize: 15)),
      onTap: () => Navigator.of(context).pushNamed(Rota.paginaCriarConta),
    );
  }
}
