import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaCriarConta extends ChangeNotifier {
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();
  final confirmaSenhaControlador = TextEditingController();

  final verificarEscritaEmail = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  String? validadorEmail(String? email) => (!verificarEscritaEmail.hasMatch(email ?? '') || email!.isEmpty) ? 'Digite um e-mail válido*' : null;

  String? validadorSenha(String? senha) {
    if (senha!.isEmpty) {
      return 'Campo obrigatório*';
    }
    if (senha.length <= 6) {
      return 'Senha mínima de 6 caracteres*';
    }
    return null;
  }

  String? validadorConfirmaSenha(String? confirmaSenha) {
    if (confirmaSenha!.isEmpty) {
      return 'Campo obrigatório*';
    }
    if (confirmaSenha != senhaControlador.text) {
      return 'As senhas não são iguas*';
    }
    return null;
  }

  Future<User?> criarConta(BuildContext context, {required String email, required String senha}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha);
      emailControlador.clear();
      senhaControlador.clear();
      confirmaSenhaControlador.clear();

      if (context.mounted) {
        Mensagens.caixaDeDialogo(context, email: email, titulo: "Parabéns!", texto: 'Sua conta foi criada com sucesso.', textoBotao: 'OK',
            onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop(Rotas.paginaEntrar);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Mensagens.snackBar(context, 'Senha Fraca!');
      } else if (e.code == 'email-already-in-use') {
        Mensagens.snackBar(context, 'E-mail em uso!');
      }
    } catch (e) {
      Mensagens.snackBar(context, 'Erro ao criar conta! $e');
    }
    return null;
  }
}
