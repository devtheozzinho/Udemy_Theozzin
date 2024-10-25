import 'package:flutter/material.dart';

class ResultadoFinal extends StatelessWidget {
  const ResultadoFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Parabens você repondeu todas as perguntas !!',
      style: TextStyle(
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    ));
  }
}
