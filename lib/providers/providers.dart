import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_criar_conta/controlador_pagina_criar_conta.dart';
import 'package:tela_de_login_01/pages/pagina_editar_dados/controlador_pagina_editar_dados.dart';
import 'package:tela_de_login_01/pages/pagina_editar_senha/controlador_pagina_editar_senha.dart';
import 'package:tela_de_login_01/pages/pagina_entrar/controlador_pagina_entrar.dart';
import 'package:tela_de_login_01/pages/pagina_excluir_conta/controlador_pagina_excluir_conta.dart';
import 'package:tela_de_login_01/pages/pagina_inicial/controlador_pagina_inicial.dart';
import 'package:tela_de_login_01/pages/pagina_recuperar/controlador_pagina_recuperar_senha.dart';
import 'package:tela_de_login_01/pages/pagina_do_usuario/controlador_pagina_do_usuario.dart';

class AppProviders {
  static final providers = [
    ChangeNotifierProvider<ControladorPaginaInicial>(create: (context) => ControladorPaginaInicial()),
    ChangeNotifierProvider<ControladorPaginaUsuario>(create: (context) => ControladorPaginaUsuario()),
    ChangeNotifierProvider<ControladorPaginaEntrar>(create: (context) => ControladorPaginaEntrar()),
    ChangeNotifierProvider<ControladorPaginaCriarConta>(create: (context) => ControladorPaginaCriarConta()),
    ChangeNotifierProvider<ControladorPaginaRecuperarSenha>(create: (context) => ControladorPaginaRecuperarSenha()),
    ChangeNotifierProvider<ControladorPaginaEditarDados>(create: (context) => ControladorPaginaEditarDados()),
    ChangeNotifierProvider<ControladorPaginaExcluirConta>(create: (context) => ControladorPaginaExcluirConta()),
    ChangeNotifierProvider<ControladorPaginaEditarSenha>(create: (context) => ControladorPaginaEditarSenha()),
  ];
}
