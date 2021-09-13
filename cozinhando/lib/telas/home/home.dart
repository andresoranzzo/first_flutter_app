import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cozinhando/modelos/receita.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome('Cozinhando em casa', 'Bolo de chocolate');
  }

  Widget _construirHome(String titulo, String textoCard) {
    return Scaffold(
      body: _construirListaCard(),
      appBar: AppBar(title: Text(titulo)),
    );
  }

  Widget _construirListaCard() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> receitas = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Receita receita = Receita.fromJson(receitas[index]);
            return _construirCard(receita.titulo, receita.foto);
          },
          itemCount: receitas == null ? 0 : receitas.length,
        );
      },
    );
  }

  Widget _construirCard(textoCard, foto) {
    return SizedBox(
      height: 332,
      child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _construirImagemCard(foto),
                  _construirGradienteCard(),
                  _construirTextoCard(textoCard)
                ],
              )
            ],
          )
      ),
    );
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7)
          ]
        )
      ),
    );
  }

  Widget _construirTextoCard(titulo) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Text(titulo, style: TextStyle(
            fontSize: 20,
            color: Colors.white
            )
        )
    );
  }

  Widget _construirImagemCard(foto) {
    return Image.asset(
        foto,
        fit: BoxFit.fill,
        height: 300);
  }
}