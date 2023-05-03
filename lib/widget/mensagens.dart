import 'dart:ui';
import 'package:flutter/material.dart';

class Mensagens {
  static void snackBar(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  static void caixaDeDialogo(BuildContext context,
      {String? email, required String titulo, required String texto, required String textoBotao, required Function()? onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            title: Text(titulo, textAlign: TextAlign.center),
            content: Text(texto),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    textoBotao,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void caixaDeDialogo2(BuildContext context,
      {required String titulo,
      required String texto,
      required String textoBotao,
      required String textoBotao2,
      required Function()? onPressed,
      required Function()? onPressed2}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            title: Text(titulo, textAlign: TextAlign.center),
            content: Text(texto),
            actions: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    textoBotao,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed2,
                  child: Text(
                    textoBotao2,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}
