import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Bottom Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PessoalScreen(),
    ExperienciaScreen(),
    FormacaoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 28.0,
            ),
            label: 'Pessoal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
              size: 28.0,
            ),
            label: 'Experiência',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              size: 28.0,
            ),
            label: 'Formação',
          ),
        ],
      ),
    );
  }
}

class PessoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ' Nome: Guilherme Garcia \n Data de Nascimento: 23/01/1999 \n Estado Civil: Solteiro',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.teal,
        ),
      ),
    );
  }
}

class ExperienciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Web designer - Input Técnologia - 2023/Atual',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.teal,
        ),
      ),
    );
  }
}

class FormacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sistemas para internet - Fiap - 2022/Atual',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.teal,
        ),
      ),
    );
  }
}
