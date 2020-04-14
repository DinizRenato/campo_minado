import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

import '../components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../components/tabuleiro_widget.dart';
import '../models/campo.dart';

class CampoMinadoApp extends StatelessWidget {
  void _reiniciar() {
    print('Reiniciar...');
  }

  void _abrir(Campo campo) {
    print('Abrir...');
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternar marcacao...');
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = new Campo(linha: 0, coluna: 0);

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(

          child: TabuleiroWidget(
            tabuleiro: Tabuleiro(
              linhas: 15,
              colunas: 15,
              qtdeBombas: 10
            ),
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
