import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tela_de_login_01/pages/pagina_do_usuario/pagina_do_usuario.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaEditarSenha extends ChangeNotifier {
  final senhaControlador = TextEditingController();
  final novaSenhaControlador = TextEditingController();
  final confirmarNovaSenhaControlador = TextEditingController();

  String? validadorSenha(String? senha) => senha!.isEmpty ? 'Campo obrigatório*' : null;

  String? validadorNovaSenha(String? novaSenha) {
    if (novaSenha!.isEmpty) {
      return 'Campo obrigatório*';
    }
    if (novaSenha.length <= 6) {
      return 'Senha mínima de 6 caracteres*';
    }
    return null;
  }

  String? validadorConfirmarNovaSenha(String? confirmaNovaSenha) {
    if (confirmaNovaSenha!.isEmpty) {
      return 'Campo obrigatório*';
    }
    if (confirmaNovaSenha != novaSenhaControlador.text) {
      return 'As senhas não conferem*';
    }
    return null;
  }

  Future<void> novaSenha(BuildContext context, {required String senhaAtual, required String novaSenha}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: senhaAtual);
        if (senhaAtual == novaSenha) {
          if (context.mounted) Mensagens.snackBar(context, 'A nova senha deve ser diferente da senha atual!');
        } else {
          await user.reauthenticateWithCredential(credential);
          await user.updatePassword(novaSenha);
          senhaControlador.clear();
          novaSenhaControlador.clear();
          confirmarNovaSenhaControlador.clear();
          senhaAtual = "";
          if (context.mounted) {
            Mensagens.caixaDeDialogo(
              context,
              titulo: "Atenção!",
              texto: 'Sua senha foi alterada com sucesso.',
              textoBotao: 'OK',
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PaginaDoUsuario()),
                  (Route<dynamic> route) => false,
                );
              },
            );
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        Mensagens.snackBar(context, 'Senha antiga inválida!');
      } else {
        Mensagens.snackBar(context, 'Erro ao alterar a senha: $e.');
      }
    } catch (e) {
      Mensagens.snackBar(context, 'Erro ao alterar a senha: $e.');
    }
  }
}
