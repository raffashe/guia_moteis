import 'package:guia_moteis/data/models/hotel_model.dart';

final mockHotelData = {
  "logo": "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
  "media": 4.6,
  "bairro": "Chácara Flora - São Paulo",
  "suites": [
    {
      "qtd": 1,
      "nome": "Suíte Marselha s/ garagem privativa",
      "fotos": [
        "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
        "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
        "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
        "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
      ]
    }
  ],
  "qtdFavoritos": 125,
  "fantasia": "Le Nid",
  "distancia": 5.0,
  "qtdAvaliacoes": 75
};

Hotel mockHotel() {
  return Hotel.fromJson(mockHotelData);
}
