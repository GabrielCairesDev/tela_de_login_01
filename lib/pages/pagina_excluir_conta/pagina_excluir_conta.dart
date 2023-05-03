import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_excluir_conta/controlador_pagina_excluir_conta.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_senha.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaExcluirConta extends StatelessWidget {
  const PaginaExcluirConta({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKeySenha = GlobalKey();
    return Consumer<ControladorPaginaExcluirConta>(
      builder: (_, controladorPaginaExcluirDados, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.delete, color: Colors.white, size: 100),
                  const SizedBox(height: 20),
                  Form(
                    key: globalKeySenha,
                    child: CampoDeTextoSenha(
                      senha: 'Senha',
                      senhaTexto: 'Digite a sua senha',
                      textoControlador: controladorPaginaExcluirDados.senhaControlador,
                      validadorSenha: controladorPaginaExcluirDados.validadorSenha,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BotaoPadrao(
                    textoBotao: 'Excluir',
                    onPressed: () {
                      if (globalKeySenha.currentState!.validate()) {
                        controladorPaginaExcluirDados.excluirConta(context, senha: controladorPaginaExcluirDados.senhaControlador.text);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
