import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Color(0xffffffff),
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Tenis Hypados"),
      centerTitle: true,
      backgroundColor: Color(0xff7d0f9a),
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          _anuncio('Tenis Dunk Vermelho', 'foto1.png',
              'Preço promocional R\$ 650.000 '),
          _anuncio('Tenis Nike Branco', 'foto2.png',
              'Preço promocional R\$ 450.000 '),
          _anuncio('Tenis air Jordan', 'foto3.png',
              'Preço promocional R\$ 850.000 '),
          _anuncio(
              'Tenis Adidas', 'foto4.png', 'Preço promocional R\$ 250.000 '),
          _anuncio('Tenis dunk panda', 'foto5.png',
              'Preço promocional R\$ 800.000 '),
        ],
      ),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "fotos/$nomeFoto",
      height: 300,
      width: 300,
      fit: BoxFit.contain,
    );
  }

  _textoAnuncio(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  _tituloAnuncio(String titulo) {
    return Text(
      titulo,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff000000),
        fontSize: 36,
      ),
    );
  }

  _anuncio(String tituloAnuncio, String caminhoFoto, String texto) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 15),
        _tituloAnuncio(tituloAnuncio),
        _foto(caminhoFoto),
        _textoAnuncio(texto),
      ]),
    );
  }
}
