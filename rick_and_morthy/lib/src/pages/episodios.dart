import 'package:flutter/material.dart';
import 'package:rick_and_morthy/src/models/personaje_model.dart';
import 'package:rick_and_morthy/src/provider/provider.dart';

class Episodios extends StatelessWidget {
  const Episodios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Caracteristica personaje = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("episodios"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: _description(personaje),
      ),
    );
  }

  Widget _description(Caracteristica pelicula) {
    final peliProvider = new PeliculaProvider();

    return FutureBuilder(
      future: peliProvider.getPopulares(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(context, snapshot.data);
        }
      },
    );
  }

  Widget _crearActoresPageView(
      BuildContext context, List<Caracteristica> personajes) {
    final _screenSize = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: personajes.length,
        itemBuilder: (context, i) {
          return Text(personajes[i].episode.toString());
        });
  }
}
