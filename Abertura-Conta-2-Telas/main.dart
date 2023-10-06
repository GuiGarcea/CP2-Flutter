import 'package:flutter/material.dart';
import 'data_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulário de Dados',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FormularioDados(),
    );
  }
}

class FormularioDados extends StatefulWidget {
  @override
  _FormularioDadosState createState() => _FormularioDadosState();
}

class _FormularioDadosState extends State<FormularioDados> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  String? sexoSelecionado;
  String? escolaridadeSelecionada;
  double limiteConta = 0.0;
  bool brasileiro = false;

  void _exibirDados() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataDisplayPage(
          nome: nomeController.text,
          idade: idadeController.text,
          sexo: sexoSelecionado ?? 'N/A',
          escolaridade: escolaridadeSelecionada ?? 'N/A',
          limiteConta: limiteConta,
          brasileiro: brasileiro,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abertura de conta'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Idade'),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: sexoSelecionado,
                onChanged: (value) {
                  setState(() {
                    sexoSelecionado = value;
                  });
                },
                items: ['Masculino', 'Feminino', 'Outro']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Sexo'),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: escolaridadeSelecionada,
                onChanged: (value) {
                  setState(() {
                    escolaridadeSelecionada = value;
                  });
                },
                items: ['Fundamental', 'Médio', 'Superior']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Escolaridade'),
              ),
              SizedBox(height: 16.0), //
              Text('Limite na Conta: R\$ ${limiteConta.toStringAsFixed(2)}'),
              SizedBox(height: 16.0), //
              Slider(
                value: limiteConta,
                onChanged: (value) {
                  setState(() {
                    limiteConta = value;
                  });
                },
                min: 0,
                max: 1000,
                divisions: 50,
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text('Brasileiro:'),
                  SizedBox(width: 8.0),
                  Switch(
                    value: brasileiro,
                    onChanged: (value) {
                      setState(() {
                        brasileiro = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _exibirDados,
                child: Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
