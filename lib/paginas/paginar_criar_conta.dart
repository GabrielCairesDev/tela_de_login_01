import 'package:flutter/material.dart';
import 'package:tela_de_login_01/template/template.dart';
import 'package:tela_de_login_01/widget/botao_confirmar.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_senha.dart';

class PaginaCriarConta extends StatelessWidget {
  const PaginaCriarConta({super.key});

  @override
  Widget build(BuildContext context) {
    return const Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment, color: Colors.white, size: 100),
          SizedBox(height: 20),
          CampoTextoPadrao(primeiroTexto: 'E-mail', segundoTexto: 'Digite o seu e-mail', icone: Icons.mail),
          SizedBox(height: 10),
          CamporDeTextoSenha(senha: 'Senha', senhaTexto: 'Digite a sua senha'),
          SizedBox(height: 10),
          CamporDeTextoSenha(senha: 'Confirme a sua senha', senhaTexto: 'Digite a sua senha'),
          SizedBox(height: 20),
          BotaoEntrar(textoBotao: 'Confirmar'),
        ],
      ),
    );
  }
}
