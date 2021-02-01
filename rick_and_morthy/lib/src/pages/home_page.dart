import 'package:flutter/material.dart';

import 'package:rick_and_morthy/src/provider/provider.dart';
import 'package:rick_and_morthy/src/widgets/card_swiper_widget.dart';
import 'package:rick_and_morthy/src/widgets/personaje_horizontal.dart';

class HomePage extends StatelessWidget {
  final personajeProvider = new PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    /*se coloca aca porque tenemos un StreamBuilder en el _footer y ese se actualiza porque 
    solo esta escuchadno pero no esta dando informacion, con esto se inicializa la primera pagina de las imagenes */
    personajeProvider.getPopulares();
    return Scaffold(
      appBar: AppBar(
        title: Text("Personajes de la serie"),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
//esto es para
    return Container(
      color: Colors.amber,
      child: FadeInImage(
        placeholder: AssetImage("assets/img/loading.gif"),
        image: AssetImage('assets/img/portada.gif'),
      ),

      //Image.asset('assets/img/portada.gif'),
    );

    // peliculaProvider.getCaracteristica();
    //return CardSwiper(
    //   peliculas: [1, 2, 3, 4, 5],
    //);
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text("personajes",
                  style: Theme.of(context).textTheme.subhead)),
          SizedBox(height: 5),
          StreamBuilder(
            stream: personajeProvider.popularStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return PersonajeHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: personajeProvider.getPopulares,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
