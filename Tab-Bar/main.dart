import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomTabBarApp(),
    );
  }
}

class CustomTabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.teal,
            tabs: [
              Tab(
                text: "Pessoal",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "Formação",
                icon: Icon(Icons.school),
              ),
              Tab(
                text: "Experiência",
                icon: Icon(Icons.work),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PersonalTab(),
            EducationTab(),
            ExperienceTab(),
          ],
        ),
      ),
    );
  }
}

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text(
          "Nome: Guilherme Garcia\nData de Nascimento: 23/01/1999\nEstado Civil: Solteiro",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text(
          "Sistemas para internet - Fiap - 2022/Atualmente",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text(
          "Web Designer - Input Técnologia - 2023/Atual.",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
