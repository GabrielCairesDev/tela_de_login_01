import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_editar_senha/controlador_pagina_editar_senha.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_senha.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaEditarSenha extends StatelessWidget {
  const PaginaEditarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKeySenha = GlobalKey();
    GlobalKey<FormState> globalKeyNovaSenha = GlobalKey();
    GlobalKey<FormState> globalKeyConfirmaNovaSenha = GlobalKey();
    return Consumer<ControladorPaginaEditarSenha>(
      builder: (_, controladorPaginaEditarSenha, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, color: Colors.white, size: 100),
                  const SizedBox(height: 20),
                  Form(
                    key: globalKeySenha,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoDeTextoSenha(
                      senha: 'Senha atual',
                      senhaTexto: 'Digite a sua senha atual',
                      textoControlador: controladorPaginaEditarSenha.senhaControlador,
                      validadorSenha: controladorPaginaEditarSenha.validadorSenha,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKeyNovaSenha,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoDeTextoSenha(
                      senha: 'Nova Senha',
                      senhaTexto: 'Digite a sua nova senha',
                      textoControlador: controladorPaginaEditarSenha.novaSenhaControlador,
                      validadorSenha: controladorPaginaEditarSenha.validadorNovaSenha,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKeyConfirmaNovaSenha,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoDeTextoSenha(
                      senha: 'Confirme a sua nova senha',
                      senhaTexto: 'Confirme a sua nova senha',
                      textoControlador: controladorPaginaEditarSenha.confirmarNovaSenhaControlador,
                      validadorSenha: controladorPaginaEditarSenha.validadorConfirmarNovaSenha,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BotaoPadrao(
                    textoBotao: 'Concluir',
                    onPressed: () {
                      if (globalKeySenha.currentState!.validate() &&
                          globalKeyNovaSenha.currentState!.validate() &&
                          globalKeyConfirmaNovaSenha.currentState!.validate()) {
                        controladorPaginaEditarSenha.novaSenha(context,
                            senhaAtual: controladorPaginaEditarSenha.senhaControlador.text,
                            novaSenha: controladorPaginaEditarSenha.novaSenhaControlador.text);
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
