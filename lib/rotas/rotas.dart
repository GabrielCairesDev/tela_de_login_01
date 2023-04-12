import 'package:flutter/material.dart';
import 'package:tela_de_login_01/paginas/pagina_inicial.dart';
import 'package:tela_de_login_01/paginas/pagina_recuperar_senha.dart';
import 'package:tela_de_login_01/paginas/paginar_criar_conta.dart';

class Rota {
  static get paginaInicial => "/";
  static get paginaCriarConta => "/pagina_criar_conta";
  static get paginaEsqueciSenha => "/pagina_recuperar_senha";

  static Route<dynamic> generatoRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const PaginaInicial());
      case "/pagina_criar_conta":
        return MaterialPageRoute(builder: (context) => const PaginaCriarConta());
      case "/pagina_recuperar_senha":
        return MaterialPageRoute(builder: (context) => const PaginaRecuperaSenha());
      default:
        return MaterialPageRoute(builder: (context) => const PaginaInicial());
    }
  }
}
