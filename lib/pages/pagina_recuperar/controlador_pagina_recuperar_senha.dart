import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tela_de_login_01/routes/rotas.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaRecuperarSenha extends ChangeNotifier {
  final emailControlador = TextEditingController();

  final verificarEscritaEmail = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  String? validadorEmail(String? email) => (!verificarEscritaEmail.hasMatch(email ?? '') || email!.isEmpty) ? 'Digite um e-mail válido*' : null;

  void enviarRecuperacao(BuildContext context, {required String email}) async {
    try {
      final usuarioEmail = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (usuarioEmail.isEmpty) {
        if (context.mounted) Mensagens.snackBar(context, 'E-mail não registrado!');
        return;
      }
      if (context.mounted) {
        Mensagens.caixaDeDialogo(
          context,
          email: email,
          titulo: "E-mail enviado!",
          texto: 'E-mail de recuperação enviado para: $email',
          textoBotao: 'OK',
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop(Rotas.paginaEntrar);
          },
        );
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emailControlador.clear();
    } catch (e) {
      Mensagens.snackBar(context, 'Erro ao tentar recuperar: $e');
    }
  }
}
