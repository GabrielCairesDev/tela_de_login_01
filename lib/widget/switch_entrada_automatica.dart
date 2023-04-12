import 'package:flutter/material.dart';
import 'package:tela_de_login_01/rotas/rotas.dart';

class SwitchEntradaAutomatica extends StatefulWidget {
  final String textoEntradaAutomatica;
  final String textoEsqueciSenha;
  const SwitchEntradaAutomatica({super.key, required this.textoEntradaAutomatica, required this.textoEsqueciSenha});

  @override
  State<SwitchEntradaAutomatica> createState() => _SwitchEntradaAutomaticaState();
}

class _SwitchEntradaAutomaticaState extends State<SwitchEntradaAutomatica> {
  bool entradaAutomatica = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Switch(
            trackOutlineColor: MaterialStateProperty.all(Colors.white),
            activeTrackColor: Colors.white70,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.white70,
            value: entradaAutomatica,
            activeColor: Colors.white,
            onChanged: (bool value) {
              setState(() => entradaAutomatica = !entradaAutomatica);
            }),
        Text(widget.textoEntradaAutomatica, style: const TextStyle(color: Colors.white, fontSize: 15)),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      child: Text(widget.textoEsqueciSenha, style: const TextStyle(color: Colors.white, fontSize: 15)),
                      onTap: () => Navigator.of(context).pushNamed(Rota.paginaEsqueciSenha)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
