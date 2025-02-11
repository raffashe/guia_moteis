import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/viewmodels/suite_provider.dart';

void main() {
  group('suiteProvider', () {
    test('deve retornar uma lista vazia se o hotelProvider não tiver dados',
        () async {
      /// Cria um ProviderContainer sem overrides, simulando um estado inicial sem dados.
      final container = ProviderContainer();

      /// Lê o provider. Como não há dados no hotelProvider, espera-se uma lista vazia.
      final suites = container.read(suiteProvider);

      /// Verifica se a lista de suítes está vazia.
      expect(suites, isEmpty);

      /// Dispose do container após o teste.
      container.dispose();
    });
  });
}
