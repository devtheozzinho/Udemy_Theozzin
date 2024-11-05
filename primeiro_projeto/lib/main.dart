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
        {'texto': 'preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacao': 5},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'branco', 'pontuacao': 7}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 10},
        {'texto': 'leão', 'pontuacao': 7},
        {'texto': 'tubarão', 'pontuacao': 2},
        {'texto': 'macaco', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual vai ser o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 9},
        {'texto': 'João', 'pontuacao': 8},
        {'texto': 'Léo', 'pontuacao': 7},
        {'texto': 'Pedro', 'pontuacao': 3},
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

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
          body: ResultadoFinal(_pontuacaoTotal, _reiniciarQuestionario),
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
            : ResultadoFinal(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
