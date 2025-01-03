import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  MeuBotao(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
