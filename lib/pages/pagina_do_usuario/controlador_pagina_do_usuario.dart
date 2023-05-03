import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaUsuario extends ChangeNotifier {
  Future<void> botaoSair(BuildContext context) async {
    try {
      final user = await SharedPreferences.getInstance();
      await FirebaseAuth.instance.signOut();
      user.setBool('entradaAutomatica', false);
      if (context.mounted) Navigator.of(context).pushReplacementNamed(Rotas.paginaEntrar);
    } catch (e) {
      Mensagens.snackBar(context, 'Erro ao tentar sair: $e');
    }
  }
}
