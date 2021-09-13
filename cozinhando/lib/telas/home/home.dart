import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirHome('Cozinhando em casa', 'Bolo de chocolate');
  }

  Widget _construirHome(String titulo, String textoCard) {
    return Scaffold(
      body: _construirCard(textoCard),
      appBar: AppBar(title: Text(titulo)),
    );
  }

  Widget _construirCard(String textoCard) {
    return SizedBox(
      height: 400,
      child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              _construirImagemCard(),
              _construirTextoCard(textoCard)
            ],
          )
      ),
    );
  }

  Widget _construirTextoCard(String textoCard) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Text(
            textoCard, style: TextStyle(fontSize: 20)));
  }

  Widget _construirImagemCard() {
    return Image.network(
        'https://blogdaflaviana.com.br/wp-content/uploads/2016/01/Baixar-Imagens-de-Bolo.jpg',
        fit: BoxFit.fill,
        height: 340);
  }
}