import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final Map _pergunta;
  final void Function(int) _responder;
  Questionario(this._pergunta, this._responder);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(_pergunta['pergunta']),
        ..._pergunta['alternativas'].map((alternativa) {
          return Resposta(
            alternativa['text'],
            () => _responder(alternativa['note']),
          );
        }).toList()
      ],
    );
  }
}
