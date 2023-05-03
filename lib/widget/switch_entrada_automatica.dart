import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_de_login_01/routes/rotas.dart';

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
  void initState() {
    super.initState();
    carregarSwitch();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Switch(
          trackOutlineColor: MaterialStateProperty.all(Colors.white),
          activeTrackColor: Colors.white70,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.white30,
          value: entradaAutomatica,
          activeColor: Colors.white,
          onChanged: (bool value) {
            setState(
              () {
                entradaAutomatica = !entradaAutomatica;
                salvarSwitch();
              },
            );
          },
        ),
        Text(widget.textoEntradaAutomatica, style: const TextStyle(color: Colors.white, fontSize: 15)),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      child: Text(widget.textoEsqueciSenha, style: const TextStyle(color: Colors.white, fontSize: 15)),
                      onTap: () => Navigator.of(context).pushNamed(Rotas.paginaEsqueciSenha)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void carregarSwitch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        entradaAutomatica = prefs.getBool('entradaAutomatica') ?? false;
      },
    );
  }

  void salvarSwitch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("entradaAutomatica", entradaAutomatica);
  }
}
