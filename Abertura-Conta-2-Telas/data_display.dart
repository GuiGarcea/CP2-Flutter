import 'package:flutter/material.dart';

class DataDisplayPage extends StatelessWidget {
  final String nome;
  final String idade;
  final String sexo;
  final String escolaridade;
  final double limiteConta;
  final bool brasileiro;

  DataDisplayPage({
    required this.nome,
    required this.idade,
    required this.sexo,
    required this.escolaridade,
    required this.limiteConta,
    required this.brasileiro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados da Conta'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome: $nome',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ),
              Text(
                'Idade: $idade anos',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ),
              Text(
                'Sexo: $sexo',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ),
              SizedBox(height: 20),
              Text(
                'Escolaridade: $escolaridade',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ),
              Text(
                'Limite na Conta: R\$ ${limiteConta.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ),
              Text(
                'Nacionalidade: ${brasileiro ? 'Brasileiro' : 'Estrangeiro'}',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
