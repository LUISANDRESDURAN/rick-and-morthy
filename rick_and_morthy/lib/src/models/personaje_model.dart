import 'package:flutter/material.dart';

class Caracteristicas {
  /*obtendre una lista de tipo caracteristica */
  List<Caracteristica> caracteristica = new List();
/*un constructor vacio */
  Caracteristicas();
  /*este constructor nos permitte reicibir el mapa de todas las respuestas */
  Caracteristicas.fronJsonList(List<dynamic> json) {
    if (json == null) return;

    for (var items in json) {
      caracteristica.add(Caracteristica.fromJsonMap(items));
    }
  }
}

class Caracteristica {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Map<String, dynamic> origin;
  Map<String, dynamic> location;
  String image;
  List<dynamic> episode;
  String url;

  Caracteristica({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
  });

  factory Caracteristica.fromJsonMap(Map<String, dynamic> json) {
    return Caracteristica(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: json["origin"],
      location: json["location"],
      image: json["image"],
      episode: json["episode"],
      url: json["url"],
    );
  }
//este get la verdad no lo estoy utilizando apra nada
  getPosterImg() {
    if (image == null) {
      return Text("no se ha cargado esta shit");
    }
    return 'https://rickandmortyapi.com/api/character/avatar/53.jpeg';
  }

  //para mostrar la misma shit pero con diferente nombre

}
