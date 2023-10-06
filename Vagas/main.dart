import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Vaga {
  final String nome;
  final double salario;
  final String descricao;
  final String contato;

  Vaga(this.nome, this.salario, this.descricao, this.contato);
}

class MyApp extends StatelessWidget {
  final List<Vaga> vagas = [
    Vaga(
        "Desenvolvedor Mobile Pleno",
        6500,
        "Procuramos um desenvolvedor mobile com experiência em Flutter para se juntar à nossa equipe. Você será responsável por desenvolver aplicativos móveis de alta qualidade para nossos clientes.",
        "contato_nova_vaga1@gmail.com"),
    Vaga(
        "Engenheiro de Dados Sênior",
        9000,
        "Estamos em busca de um engenheiro de dados altamente qualificado para liderar nossos esforços de processamento e análise de dados. Você será responsável por projetar e manter pipelines de dados escaláveis e eficientes.",
        "contato_nova_vaga2@gmail.com"),
    Vaga(
        "Designer de UI/UX Júnior",
        4500,
        "Estamos à procura de um designer de UI/UX criativo e apaixonado para ajudar a criar interfaces de usuário incríveis para nossos produtos. Você será responsável por projetar wireframes, protótipos e layouts.",
        "contato_nova_vaga3@gmail.com"),
    Vaga(
        "Analista de Segurança da Informação",
        7500,
        "Procuramos um analista de segurança da informação para garantir a proteção de dados e sistemas. Você será responsável por identificar vulnerabilidades, implementar medidas de segurança e monitorar ameaças.",
        "contato_nova_vaga4@gmail.com"),
    Vaga(
        "Desenvolvedor Front-End Sênior",
        8000,
        "Estamos em busca de um desenvolvedor front-end experiente para liderar o desenvolvimento de interfaces de usuário de alta qualidade. Você será responsável por implementar designs e otimizar o desempenho do front-end.",
        "contato_nova_vaga5@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.black,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas"),
      centerTitle: true,
      backgroundColor: Color(0xfff32121),
    );
  }

  _corpo() {
    return Container(
      child: ListView.builder(
        itemCount: vagas.length,
        itemBuilder: (context, index) {
          return _vagaCard(vagas[index]);
        },
      ),
    );
  }

  _vagaCard(Vaga vaga) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              vaga.nome,
              style: TextStyle(
                color: Color(0xff000989),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Salário: \$${vaga.salario.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16, 
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Descrição: ${vaga.descricao}",
              style: TextStyle(
                fontSize: 16, 
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Contato: ${vaga.contato}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
