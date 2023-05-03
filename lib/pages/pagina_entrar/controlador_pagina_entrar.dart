import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaEntrar extends ChangeNotifier {
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();

  final verificarEscritaEmail = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  String? validadorEmail(String? email) => (!verificarEscritaEmail.hasMatch(email ?? '') || email!.isEmpty) ? 'Digite um e-mail válido*' : null;

  String? validadorSenha(String? senha) {
    if (senha!.isEmpty) {
      return 'Campo obrigatório*';
    }
    return null;
  }

  Future<User?> entrarNaConta(BuildContext context, {required String email, required String senha}) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
      emailControlador.clear();
      senhaControlador.clear();
      if (context.mounted) Navigator.of(context).pushReplacementNamed(Rotas.paginaDoUsuario);
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Mensagens.snackBar(context, 'E-mail não registrado!');
      } else if (e.code == 'wrong-password') {
        Mensagens.snackBar(context, 'Senha inválida!');
      } else if (e.code == 'invalid-email') {
        Mensagens.snackBar(context, 'E-mail inválido!');
      } else {
        Mensagens.snackBar(context, 'Erro ao fazer login!');
      }
    } catch (e) {
      Mensagens.snackBar(context, 'Erro ao fazer login! $e');
    }
    return null;
  }
}
