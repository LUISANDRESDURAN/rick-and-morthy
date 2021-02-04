import 'package:flutter/material.dart';
import 'package:rick_and_morthy/src/pages/drawer.dart';
import 'package:rick_and_morthy/src/pages/episodios.dart';

import 'package:rick_and_morthy/src/pages/home_page.dart';
import 'package:rick_and_morthy/src/pages/info_personaje.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morthy',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => DrawerHome(),
        'principal': (BuildContext context) => HomePage(),
        'detalle2': (BuildContext context) => InfoPersonaje(),
        'episodio': (BuildContext context) => Episodios(),
      },
    );
  }
}
