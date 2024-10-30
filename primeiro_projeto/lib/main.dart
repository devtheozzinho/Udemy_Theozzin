import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';
import './respostas.dart';

void main() {
  runApp(PerguntaApp());
  print('');
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'pontuacão': 10},
        {'texto': 'vermelho', 'pontuacão': 5},
        {'texto': 'verde', 'pontuacão': 3},
        {'texto': 'branco', 'pontuacão': 7}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacão': 10},
        {'texto': 'leão', 'pontuacão': 7},
        {'texto': 'tubarão', 'pontuacão': 2},
        {'texto': 'macaco', 'pontuacão': 4},
      ],
    },
    {
      'texto': 'Qual vai ser o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacão': 9},
        {'texto': 'João', 'pontuacão': 8},
        {'texto': 'Léo', 'pontuacão': 7},
        {'texto': 'Pedro', 'pontuacão': 3},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  @override
  Widget build(BuildContext context) {
    final perguntaAtual =
        temPerguntaSelecionada ? _perguntas[_perguntaSelecionada] : null;

    List<String>? respostas = temPerguntaSelecionada
        ? (perguntaAtual!['respostas'] as List<Map<String, Object>>?)
            ?.map((resp) => resp['texto'] as String)
            .toList()
        : null;

    if (perguntaAtual == null) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          body: ResultadoFinal(),
        ),
      );
    }

    List<String> resposta =
        (perguntaAtual['respostas'] as List<Map<String, Object>>)
            .map((resp) => resp['texto'] as String)
            .toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
