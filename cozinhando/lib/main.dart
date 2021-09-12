import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
            body:
            SizedBox(
              height: 400,
              child: Card(
                  child: Column(
                    children: <Widget>[
                      Image.network('https://blogdaflaviana.com.br/wp-content/uploads/2016/01/Baixar-Imagens-de-Bolo.jpg'),
                      Text('Bolo de laranja')
                    ],
                  )
              ),
            ),
            appBar: AppBar(title: Text('Cozinhando em casa')),
        )
    );
  }
}
