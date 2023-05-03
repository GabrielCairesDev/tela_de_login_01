import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tela_de_login_01/pages/pagina_inicial/controlador_pagina_inicial.dart';
import 'package:tela_de_login_01/widget/plano_de_fundo.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControladorPaginaInicial>(
      builder: (_, controladorPaginaInicial, __) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              const PlanoDeFundo(),
              FutureBuilder<String>(
                future: carregando,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      const Icon(Icons.check_circle_outline, color: Colors.white, size: 60),
                      const Text('Dados carregados!', style: TextStyle(color: Colors.white)),
                    ];
                    controladorPaginaInicial.verificarEntrada(context);
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(Icons.error_outline, color: Colors.white, size: 60),
                      Text('Erro ao carregar! ${snapshot.error}', style: const TextStyle(color: Colors.white)),
                    ];
                  } else {
                    children = const <Widget>[
                      SizedBox(width: 40, height: 40, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 5)),
                      Text('Carregando...', style: TextStyle(color: Colors.white)),
                    ];
                  }
                  return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: children),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

final carregando = Future.delayed(const Duration(seconds: 2), () => 'Dados carregados');
