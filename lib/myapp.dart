import 'package:flutter/material.dart';
import 'package:tela_de_login_01/core/ui/styles/theme_app.dart';
import 'rotas/rotas.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeDart,
      initialRoute: '/',
      onGenerateRoute: Rota.generatoRoute,
    );
  }
}
