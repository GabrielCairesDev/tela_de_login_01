import 'package:flutter/material.dart';
import 'package:tela_de_login_01/template/template.dart';
import 'package:tela_de_login_01/widget/botao_confirmar.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_senha.dart';
import 'package:tela_de_login_01/widget/switch_entrada_automatica.dart';
import 'package:tela_de_login_01/widget/link_criar_conta.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.badge, color: Colors.white, size: 100),
          SizedBox(height: 20),
          CampoTextoPadrao(primeiroTexto: 'E-mail', segundoTexto: 'Digite o seu e-mail', icone: Icons.mail),
          SizedBox(height: 10),
          CamporDeTextoSenha(senha: 'Senha', senhaTexto: 'Digite a sua senha'),
          SizedBox(height: 5),
          SwitchEntradaAutomatica(textoEntradaAutomatica: 'Entrada automatica', textoEsqueciSenha: 'Recuperar senha   '),
          SizedBox(height: 5),
          BotaoEntrar(textoBotao: 'Entrar'),
          SizedBox(height: 10),
          LinkCriarConta(textoCriarConta: 'Criar Conta'),
        ],
      ),
    );
  }
}
