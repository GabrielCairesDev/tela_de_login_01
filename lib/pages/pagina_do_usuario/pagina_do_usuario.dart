import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_do_usuario/controlador_pagina_do_usuario.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaDoUsuario extends StatelessWidget {
  const PaginaDoUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Consumer<ControladorPaginaUsuario>(
      builder: (_, controladorPaginaUsuario, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              Positioned(
                  top: 32,
                  right: 3,
                  child: IconButton(
                      onPressed: () {
                        controladorPaginaUsuario.botaoSair(context);
                      },
                      icon: const Icon(Icons.logout),
                      color: Colors.white,
                      iconSize: 40)),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people, color: Colors.white, size: 100),
                    Text(
                      'Email: ${user?.email.toString() ?? 'E-mail não encontrado'}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    BotaoPadrao(
                      textoBotao: 'Editar',
                      onPressed: () {
                        Navigator.of(context).pushNamed(Rotas.paginaEditarDados);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
