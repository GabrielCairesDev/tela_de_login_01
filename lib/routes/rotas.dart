import 'package:flutter/material.dart';
import 'package:tela_de_login_01/pages/pagina_editar_dados/pagina_editar_dados.dart';
import 'package:tela_de_login_01/pages/pagina_editar_senha/pagina_editar_senha.dart';
import 'package:tela_de_login_01/pages/pagina_excluir_conta/pagina_excluir_conta.dart';
import 'package:tela_de_login_01/pages/pagina_inicial/pagina_inicial.dart';
import 'package:tela_de_login_01/pages/pagina_criar_conta/pagina_criar_conta.dart';
import 'package:tela_de_login_01/pages/pagina_entrar/pagina_entrar.dart';
import 'package:tela_de_login_01/pages/pagina_recuperar/pagina_recuperar_senha.dart';
import 'package:tela_de_login_01/pages/pagina_do_usuario/pagina_do_usuario.dart';

class Rotas {
  static get paginaInicial => "/";
  static get paginaDoUsuario => "/pagina_do_usuario";
  static get paginaEntrar => "/pagina_entrar";
  static get paginaCriarConta => "/pagina_criar_conta";
  static get paginaEsqueciSenha => "/pagina_recuperar_senha";
  static get paginaEditarDados => "/pagina_editar_dados";
  static get paginaExcluirDados => "/pagina_excluir_dados";
  static get paginaEditarSenha => "/pagina_editar_senha";

  static Route<dynamic> generatoRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const PaginaInicial());
      case "/pagina_do_usuario":
        return MaterialPageRoute(builder: (context) => const PaginaDoUsuario());
      case "/pagina_entrar":
        return MaterialPageRoute(builder: (context) => const PaginaEntrar());
      case "/pagina_criar_conta":
        return MaterialPageRoute(builder: (context) => const PaginaCriarConta());
      case "/pagina_recuperar_senha":
        return MaterialPageRoute(builder: (context) => const PaginaRecuperaSenha());
      case "/pagina_editar_dados":
        return MaterialPageRoute(builder: (context) => const PaginaEditarDados());
      case "/pagina_excluir_dados":
        return MaterialPageRoute(builder: (context) => const PaginaExcluirConta());
      case "/pagina_editar_senha":
        return MaterialPageRoute(builder: (context) => const PaginaEditarSenha());
      default:
        return MaterialPageRoute(builder: (context) => const PaginaInicial());
    }
  }
}
