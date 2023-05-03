import 'package:flutter/material.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/botao_padrao.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaEditarDados extends StatelessWidget {
  const PaginaEditarDados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const PlanoDeFundo(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.white, size: 65),
                    Expanded(
                      child: BotaoPadrao(
                        textoBotao: 'Editar senha',
                        onPressed: () {
                          Navigator.of(context).pushNamed(Rotas.paginaEditarSenha);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Rotas.paginaExcluirDados);
        },
        backgroundColor: const Color.fromARGB(255, 234, 77, 114),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
