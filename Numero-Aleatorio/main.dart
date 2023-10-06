import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _numeroAleatorio = 0;

  void _gerarNumeroAleatorio() {
    final random = Random();
    final novoNumeroAleatorio = random.nextInt(11); 
    setState(() {
      _numeroAleatorio = novoNumeroAleatorio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jogo do Número Aleatório"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _img(),
          _texto(),
          _numeroGerado(),
          SizedBox(height: 16),
          _botaoGerar(),
        ],
      ),
    );
  }

  Widget _texto() {
    return Center(
      child: Text(
        "Pense em um número \n de 0 a 10",
        style: TextStyle(color: Colors.white, fontSize: 25),
        textAlign: TextAlign.center, 
      ),
    );
  }

  _img() {
    return Center(
      child: Image.network(
        'https://img.elo7.com.br/product/original/4560189/bottom-charada-button-3-5-cm-broche-alfinete-kits.jpg',
        height: 150,
        width: 150,
      ),
    );
  }

  _numeroGerado() {
    return Text(
      '$_numeroAleatorio',
      style: TextStyle(
        color: Colors.white,
        fontSize: 100,
      ),
    );
  }

  _botaoGerar() {
    return Container(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff06b700),
        ),
        onPressed: () {
          _gerarNumeroAleatorio();
        },
        child: Text(
          "Descobrir",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
