import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_entrar/controlador_pagina_entrar.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_padrao.dart';
import 'package:tela_de_login_01/widget/campo_de_texto_senha.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';
import 'package:tela_de_login_01/widget/switch_entrada_automatica.dart';

class PaginaEntrar extends StatefulWidget {
  const PaginaEntrar({super.key});

  @override
  State<PaginaEntrar> createState() => _PaginaEntrarState();
}

class _PaginaEntrarState extends State<PaginaEntrar> {
  GlobalKey<FormState> globalKeyEmail = GlobalKey();
  GlobalKey<FormState> globalKeySenha = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<ControladorPaginaEntrar>(
      builder: (_, controladorPaginaEntrar, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.badge, color: Colors.white, size: 100),
                  const SizedBox(height: 20),
                  Form(
                    key: globalKeyEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: CampoTextoPadrao(
                      primeiroTexto: 'E-mail',
                      segundoTexto: 'Digite o seu e-mail',
                      icone: Icons.mail,
                      textoControlador: controladorPaginaEntrar.emailControlador,
                      validadorEmail: controladorPaginaEntrar.validadorEmail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKeySenha,
                    child: CampoDeTextoSenha(
                      senha: 'Senha',
                      senhaTexto: 'Digite a sua senha',
                      textoControlador: controladorPaginaEntrar.senhaControlador,
                      validadorSenha: controladorPaginaEntrar.validadorSenha,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SwitchEntradaAutomatica(
                    textoEntradaAutomatica: 'Entrada automatica',
                    textoEsqueciSenha: 'Recuperar senha',
                  ),
                  const SizedBox(height: 5),
                  BotaoPadrao(
                    textoBotao: 'Entrar',
                    onPressed: () async {
                      if (globalKeyEmail.currentState!.validate() && globalKeySenha.currentState!.validate()) {
                        await controladorPaginaEntrar.entrarNaConta(context,
                            email: controladorPaginaEntrar.emailControlador.text, senha: controladorPaginaEntrar.senhaControlador.text);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    child: const Text('Criar Conta', style: TextStyle(color: Colors.white, fontSize: 15)),
                    onTap: () => Navigator.of(context).pushNamed(Rotas.paginaCriarConta),
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
