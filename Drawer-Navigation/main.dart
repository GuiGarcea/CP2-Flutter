import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20.0),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Guilherme Garcia'),
              accountEmail: Text('rm94392@fiap.com.br'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/foto.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            DrawerListItem(
              title: 'Pessoal',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PessoalScreen()),
                );
              },
            ),
            DrawerListItem(
              title: 'Formação',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormacaoScreen()),
                );
              },
            ),
            DrawerListItem(
              title: 'Experiência',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExperienciaScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: CenterTextWidget(
        text:
            'Bem-vindo a Home!\nNeste App estamos utilizando Menu com Drawer Navigation',
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final String title;
  final Function onTap;

  DrawerListItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(Icons.person),
      onTap: () => onTap(),
    );
  }
}

class CenterTextWidget extends StatelessWidget {
  final String text;

  CenterTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class PessoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal'),
      ),
      body: CenterTextWidget(
        text: 'Data de Nascimento: 23/01/1999\nEstado Civil: Solteiro',
      ),
    );
  }
}

class FormacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formação'),
      ),
      body: CenterTextWidget(
        text: 'Sistemas para internet - Fiap - 2022/Atualmente',
      ),
    );
  }
}

class ExperienciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiência'),
      ),
      body: CenterTextWidget(
        text: 'Web designer - Input Técnologia - 2023/Atual',
      ),
    );
  }
}
