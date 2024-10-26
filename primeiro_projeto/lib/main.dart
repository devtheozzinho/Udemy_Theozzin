import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';
import './respostas.dart';

void main() {
  runApp(PerguntaApp());
  print('oii');
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'nota': 10},
        {'texto': 'vermelho', 'nota': 5},
        {'texto': 'verde', 'nota': 3},
        {'texto': 'branco', 'nota': 7}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'nota': 10},
        {'texto': 'leão', 'nota': 7},
        {'texto': 'tubarão', 'nota': 2},
        {'texto': 'macaco', 'nota': 4},
      ],
    },
    {
      'texto': 'Qual vai ser o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 9},
        {'texto': 'João', 'nota': 8},
        {'texto': 'Léo', 'nota': 7},
        {'texto': 'Pedro', 'nota': 3},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> perguntaAtual =
        temPerguntaSelecionada ? _perguntas[_perguntaSelecionada] : {};

    List<String>? respostas = temPerguntaSelecionada
        ? (perguntaAtual['respostas'] as List<String>?)
        : null;

    List<Widget> widgets = [];
    if (respostas != null) {
      widgets = respostas.map((t) => MeuBotao(t, responder)).toList();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          titleTextStyle: TextStyle(),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: responder,
              )
            : ResultadoFinal(),
      ),
    );
  }
}
