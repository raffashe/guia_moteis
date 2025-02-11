import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Category Item Model Mock Tests', () {
    final categoryItemMockJson = '''
    [
      {
        "nome": "Decoração Erótica",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png"
      },
      {
        "nome": "Decoração Temática",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-tematica-22-08-2018-11-40.png"
      },
      {
        "nome": "Pole Dance",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/pole-dance-15-05-2020-10-49.png"
      },
      {
        "nome": "Frigobar",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
      },
      {
        "nome": "Ar-Condicionado",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
      },
      {
        "nome": "Internet Wi-Fi",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
      },
      {
        "nome": "Secador de Cabelo",
        "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
      }
    ]
    ''';

    test('should parse category item mock JSON correctly', () {
      final List<dynamic> decodedJson = jsonDecode(categoryItemMockJson);

      expect(decodedJson.length, 7);

      expect(decodedJson[0]['nome'], 'Decoração Erótica');
      expect(decodedJson[0]['icone'],
          'https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png');

      expect(decodedJson[6]['nome'], 'Secador de Cabelo');
      expect(decodedJson[6]['icone'],
          'https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png');
    });

    test('should contain correct keys in category item', () {
      final List<dynamic> decodedJson = jsonDecode(categoryItemMockJson);

      for (var item in decodedJson) {
        expect(item.containsKey('nome'), true);
        expect(item.containsKey('icone'), true);
      }
    });
  });
}
