import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int _pontuacao;
  final void Function() _reiniciarQuestionario;
  Resultado(this._pontuacao, this._reiniciarQuestionario);

  String get fraseResultado {
    if (_pontuacao < 8) {
      return 'Parabéns!';
    } else if (_pontuacao < 12) {
      return 'Você é bom!';
    } else if (_pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar!',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: _reiniciarQuestionario,
        )
      ],
    );
  }
}
