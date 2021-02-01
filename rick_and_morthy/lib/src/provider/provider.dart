import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:rick_and_morthy/src/models/personaje_model.dart';

class PeliculaProvider {
  String _url = 'rickandmortyapi.com';
  int _popularPage = 0;
  bool _cargando = false;

/*esto es un simple contenedor de personajes, colocarle new list lo ahce dinamico */
  List<Caracteristica> _populares = new List();
  /*si no se le coloca el broadscat solo una persona escucha, si se le coloca
  muchas personas pueden escuchar */
  final _popularesStreamController =
      StreamController<List<Caracteristica>>.broadcast();

/*regla que la funcion debe cumplir, si no va a mandar un error */
  Function(List<Caracteristica>) get popularSink =>
      _popularesStreamController.sink.add;

  Stream<List<Caracteristica>> get popularStream =>
      _popularesStreamController.stream;

/*si no cerramos los streams va a crear multiples stream, pero se necesitan cerrar
para evitar ese conflicto */

  void disposeStream() {
    /*?queire decir que si tiene el metdo oclose llamalo, sin o pues no lo llames */
    _popularesStreamController?.close();
  }

  Future<List<Caracteristica>> getCaracteristica() async {
    final url = Uri.https(_url, 'api/character', {});

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
/*este constructor se encargara de barrera cada una de los resultados y generarme
los episodio de rick and morty */
    final peliculas = new Caracteristicas.fronJsonList(decodeData['results']);
    //print(peliculas.caracteristica[0].name);
    return peliculas.caracteristica;
  }

  Future<List<Caracteristica>> getPopulares() async {
    /*copn este bollean optimizaremos un poco el codigo */
    if (_cargando) return [];

    _cargando = true;
    _popularPage++;

    final url =
        Uri.https(_url, 'api/character', {'page': _popularPage.toString()});

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
/*este constructor se encargara de barrera cada una de los resultados y generarme
los episodio de rick and morty */
    final peliculas = new Caracteristicas.fronJsonList(decodeData['results']);
    //print(peliculas.caracteristica[0].name);

    final respu = peliculas.caracteristica;

    _populares.addAll(respu);
    popularSink(_populares);
    /*cuabdo tenemos la respuesta pasamos cargando a falso */
    _cargando = false;
    return respu;
  }
}
