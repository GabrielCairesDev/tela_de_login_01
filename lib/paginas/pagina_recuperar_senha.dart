import 'package:flutter/material.dart';
import 'package:tela_de_login_01/template/template.dart';
import 'package:tela_de_login_01/widget/botao_confirmar.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_padrao.dart';

class PaginaRecuperaSenha extends StatelessWidget {
  const PaginaRecuperaSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return const Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail, color: Colors.white, size: 100),
          SizedBox(height: 20),
          CampoTextoPadrao(primeiroTexto: 'E-mail', segundoTexto: 'Digite o seu e-mail para recuperação', icone: Icons.mail),
          SizedBox(height: 20),
          BotaoEntrar(textoBotao: 'Enviar'),
        ],
      ),
    );
  }
}
