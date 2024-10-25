import 'package:flutter/material.dart';
import './questao.dart';

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
    List<String>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<String>?
        : null;

    return Column(
      children: [
        Questao(perguntaSelecionada.toString()),
        if (respostas != null)
          ...respostas
              .map((resposta) => ElevatedButton(
                    onPressed: quantoResponder,
                    child: Text(resposta),
                  ))
              .toList(),
      ],
    );
  }
}
