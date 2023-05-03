import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_criar_conta/controlador_pagina_criar_conta.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_senha.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaCriarConta extends StatefulWidget {
  const PaginaCriarConta({super.key});

  @override
  State<PaginaCriarConta> createState() => _PaginaCriarContaState();
}

class _PaginaCriarContaState extends State<PaginaCriarConta> {
  GlobalKey<FormState> globalKeyEmail = GlobalKey();
  GlobalKey<FormState> globalKeySenha = GlobalKey();
  GlobalKey<FormState> globalKeyConfirmaSenha = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<ControladorPaginaCriarConta>(
      builder: (_, controladorPaginaCriarConta, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.assignment, color: Colors.white, size: 100),
                  const SizedBox(height: 20),
                  Form(
                    key: globalKeyEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoTextoPadrao(
                      primeiroTexto: 'E-mail',
                      segundoTexto: 'Digite o seu e-mail',
                      icone: Icons.mail,
                      textoControlador: controladorPaginaCriarConta.emailControlador,
                      validadorEmail: controladorPaginaCriarConta.validadorEmail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKeySenha,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoDeTextoSenha(
                      senha: 'Senha',
                      senhaTexto: 'Digite a sua senha',
                      textoControlador: controladorPaginaCriarConta.senhaControlador,
                      validadorSenha: controladorPaginaCriarConta.validadorSenha,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKeyConfirmaSenha,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoDeTextoSenha(
                      senha: 'Confirme a sua senha',
                      senhaTexto: 'Digite a sua senha',
                      textoControlador: controladorPaginaCriarConta.confirmaSenhaControlador,
                      validadorSenha: controladorPaginaCriarConta.validadorConfirmaSenha,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BotaoPadrao(
                    textoBotao: 'Confirmar',
                    onPressed: () {
                      if (globalKeyEmail.currentState!.validate() &&
                          globalKeySenha.currentState!.validate() &&
                          globalKeyConfirmaSenha.currentState!.validate()) {
                        controladorPaginaCriarConta.criarConta(
                            email: controladorPaginaCriarConta.emailControlador.text,
                            senha: controladorPaginaCriarConta.senhaControlador.text,
                            context);
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
