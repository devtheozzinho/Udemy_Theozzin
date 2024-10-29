import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() quantoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>?
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        if (respostas != null)
          ...respostas.map((resp) {
            final texto = resp['texto'] as String?;
            return MeuBotao(
              texto ?? 'Texto indisponível',
              quantoResponder,
            );
          }).toList(),
      ],
    );
  }
}
