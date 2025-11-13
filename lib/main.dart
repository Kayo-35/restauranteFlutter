import 'package:flutter/material.dart';
import 'package:aula1/telaLogin.dart';
import 'exemplo.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      home: telaLogin(),
    );
  }
  
}