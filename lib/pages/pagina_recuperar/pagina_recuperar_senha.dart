import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_recuperar/controlador_pagina_recuperar_senha.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_padrao.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaRecuperaSenha extends StatefulWidget {
  const PaginaRecuperaSenha({super.key});

  @override
  State<PaginaRecuperaSenha> createState() => _PaginaRecuperaSenhaState();
}

class _PaginaRecuperaSenhaState extends State<PaginaRecuperaSenha> {
  GlobalKey<FormState> globalKeyEmail = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<ControladorPaginaRecuperarSenha>(
      builder: (_, controladorPaginaRecuperarSenha, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mail, color: Colors.white, size: 100),
                  const SizedBox(height: 20),
                  Form(
                    key: globalKeyEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoTextoPadrao(
                      primeiroTexto: 'E-mail',
                      segundoTexto: 'Digite o seu e-mail para recuperação',
                      icone: Icons.mail,
                      textoControlador: controladorPaginaRecuperarSenha.emailControlador,
                      validadorEmail: controladorPaginaRecuperarSenha.validadorEmail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BotaoPadrao(
                    textoBotao: 'Enviar',
                    onPressed: () {
                      if (globalKeyEmail.currentState!.validate()) {
                        controladorPaginaRecuperarSenha.enviarRecuperacao(context, email: controladorPaginaRecuperarSenha.emailControlador.text);
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
