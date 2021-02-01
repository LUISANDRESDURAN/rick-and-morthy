import 'package:flutter/material.dart';
import 'package:rick_and_morthy/src/models/personaje_model.dart';

class InfoPersonaje extends StatelessWidget {
  const InfoPersonaje({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Caracteristica personaje = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(personaje.name),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.red,
              child: Image(
                  image: NetworkImage(personaje.image), fit: BoxFit.cover),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID: " + personaje.id.toString(),
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("STATUS: " + personaje.status,
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("SPECIE: " + personaje.species,
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("TYPE: " + personaje.type,
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("GENDER: " + personaje.gender,
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("ORIGIN:   " + personaje.origin.toString(),
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: RaisedButton(
                        child: Text("episodio"),
                        onPressed: () {
                          Navigator.pushNamed(context, 'episodio',
                              arguments: personaje);
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
