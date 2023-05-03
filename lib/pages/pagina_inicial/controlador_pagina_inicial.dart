import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaInicial extends ChangeNotifier {
  void verificarEntrada(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool entradaAutomatica = prefs.getBool('entradaAutomatica') ?? false;
      var user = FirebaseAuth.instance.currentUser;
      if (user != null && entradaAutomatica == true) {
        if (context.mounted) Navigator.of(context).pushReplacementNamed(Rotas.paginaDoUsuario);
      } else {
        FirebaseAuth.instance.signOut();
        prefs.setBool("entradaAutomatica", false);
        if (context.mounted) Navigator.of(context).pushReplacementNamed(Rotas.paginaEntrar);
      }
    } catch (e) {
      Mensagens.snackBar(context, 'Ocorreu um erro não esperado! $e');
    }
    return null;
  }
}
