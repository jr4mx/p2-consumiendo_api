// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, duplicate_ignore, unused_import

//import 'dart:developer';

//import 'package:consumir_appi/models/pages/pagina_home.dart';
//import 'package:consumir_appi/models/pages/pagina_usuarios.dart';
import 'package:consumir_appi/models/pages/pagina_home.dart';
import 'package:consumir_appi/models/pages/pagina_usuarios.dart';
//import 'package:consumir_appi/models/usuario.model.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Listado de Usuarios',
        home: miPagina());
  }
}

class miPagina extends StatefulWidget {
  @override
  State<miPagina> createState() => _miPaginaState();
}

class _miPaginaState extends State<miPagina> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [
    paginaHome(),
    paginaUsuarios(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios API'),
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'Usuarios'),
        ],
      ),
    );
  }
}

class widget {}
