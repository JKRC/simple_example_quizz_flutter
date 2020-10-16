import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacao = 0;

  final _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'alternativas': [
        {'text': 'Preto', 'note': 10},
        {'text': 'Vermelho', 'note': 5},
        {'text': 'Verde', 'note': 3},
        {'text': 'Branco', 'note': 1},
      ]
    },
    {
      'pergunta': 'Qual é seu animal favorito?',
      'alternativas': [
        {'text': 'Coelho', 'note': 10},
        {'text': 'Cobra', 'note': 5},
        {'text': 'Elefante', 'note': 3},
        {'text': 'Leão', 'note': 1},
      ]
    },
    {
      'pergunta': 'Qual é seu instrutor favorito?',
      'alternativas': [
        {'text': 'Maria', 'note': 10},
        {'text': 'João', 'note': 5},
        {'text': 'Leo', 'note': 3},
        {'text': 'Pedro', 'note': 1},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temProximaPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacao += pontuacao;
      });
    }
    print('Pergunta Respondida!');
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacao = 0;
    });
  }

  bool get temProximaPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext buildContext) {
    /* for (String textoResp in respostas) {
      widgetsRespostas.add(Resposta(textoResp, _responder));
    } */
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temProximaPergunta
            ? Questionario(_perguntas[_perguntaSelecionada], _responder)
            : Resultado(
                _pontuacao,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}
