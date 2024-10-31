import 'package:flutter/material.dart';

class ResultadoFinal extends StatelessWidget {
  final int pontuacao;

  ResultadoFinal(this.pontuacao);

  String get fraseResultado {
    if (pontuacao < 12) {
      return 'Parabens';
    } else if (pontuacao < 14) {
      return 'Voce é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      fraseResultado,
      style: TextStyle(
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    ));
  }
}
