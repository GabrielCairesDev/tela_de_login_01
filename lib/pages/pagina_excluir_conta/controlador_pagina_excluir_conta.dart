import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tela_de_login_01/pages/pagina_entrar/pagina_entrar.dart';
import 'package:tela_de_login_01/widget/mensagens.dart';

class ControladorPaginaExcluirConta extends ChangeNotifier {
  final senhaControlador = TextEditingController();

  String? validadorSenha(String? senha) {
    if (senha!.isEmpty) {
      return 'Campo obrigatório*';
    }
    return null;
  }

  Future<void> excluirConta(BuildContext context, {required String senha}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: senha);
        await user.reauthenticateWithCredential(credential);
        await user.delete();
        senhaControlador.clear();
        if (context.mounted) {
          Mensagens.caixaDeDialogo(context, titulo: "Atenção!", texto: 'Sua conta foi excluída com sucesso.', textoBotao: 'OK', onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const PaginaEntrar()),
              (Route<dynamic> route) => false,
            );
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        Mensagens.snackBar(context, 'Senha inválida!');
      } else {
        Mensagens.snackBar(context, 'Erro ao excluir a conta: $e.');
      }
    } catch (e) {
      Mensagens.snackBar(context, 'Erro ao excluir a conta: $e.');
    }
  }
}
