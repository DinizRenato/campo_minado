import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abrir Campo com Explosão', () {
      Campo c = new Campo(linha: 0, coluna: 0);
      c.minar();

      expect(c.abrir, throwsException);
    });
    test('Abrir Campo sem Explosão', () {
      Campo c = new Campo(linha: 0, coluna: 0);
      c.abrir();

      expect(c.aberto, isTrue);
    });
    test('Adicionar não vizinho', () {
      Campo c1 = new Campo(linha: 0, coluna: 0);
      Campo c2 = new Campo(linha: 1, coluna: 3);
      c1.adicionarVizinho(c2);
      expect(c1.vizinhos.isEmpty, isTrue);
    });
    test('Adicionar vizinho', () {
      Campo c1 = new Campo(linha: 0, coluna: 0);
      Campo c2 = new Campo(linha: 1, coluna: 3);
      Campo c3 = new Campo(linha: 1, coluna: 1);
      Campo c4 = new Campo(linha: 0, coluna: 1);
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.vizinhos.length, 2);
    });
    test('Minas na vizinhanca', () {
      Campo c1 = new Campo(linha: 0, coluna: 0);
      Campo c2 = new Campo(linha: 1, coluna: 3);
      c2.minar();
      Campo c3 = new Campo(linha: 1, coluna: 1);
      c3.minar();
      Campo c4 = new Campo(linha: 0, coluna: 1);
      c4.minar();
      Campo c5 = new Campo(linha: 1, coluna: 2);

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      c1.adicionarVizinho(c5);

      expect(c1.qtdeMinasNaVizinhanca, 2);
    });
  });
}
