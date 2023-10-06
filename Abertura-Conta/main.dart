import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
        ),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Dados da Conta',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nome: ${nomeController.text}',
                  style: TextStyle(fontSize: 18)),
              Text('Idade: ${idadeController.text} anos',
                  style: TextStyle(fontSize: 18)),
              Text('Sexo: $sexoSelecionado', style: TextStyle(fontSize: 18)),
              Text('Escolaridade: $escolaridadeSelecionada',
                  style: TextStyle(fontSize: 18)),
              Text(
                'Limite na Conta: R\$ ${limiteConta.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Nacionalidade: ${brasileiro ? 'Brasileiro' : 'Estrangeiro'}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Abertura de conta',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Idade',
                  labelStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
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
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  labelStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
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
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Escolaridade',
                  labelStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Limite na Conta: R\$ ${limiteConta.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 16.0),
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
                  Text('Brasileiro:', style: TextStyle(fontSize: 18)),
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
                child: Text(
                  'Confirmar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
