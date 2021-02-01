import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


import 'package:rick_and_morthy/src/models/personaje_model.dart';

class CardSwiper extends StatelessWidget {
  /*como necesitamos recibir la lista de tarjetas que se van a mostrar
  por eso se utliza como parametro en el constructor */
  final List<Caracteristica> peliculas;

  const CardSwiper({Key key, @required this.peliculas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 300,
      child: Swiper(
        /*para saber mas de este SwiperLayout leer documentacion 
        ---https://pub.dev/packages/flutter_swiper */

        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(
                  peliculas[index].image,
                ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
              ));
        },
        itemCount: peliculas.length,
        /*el SwiperPagination lo que hace es que muestra tres putnos dentro del carrusel */
        //pagination: new SwiperPagination(),
        /*muestra unas flechas para indicar que se puede seguir dezplazando */
        //control: new SwiperControl(),
      ),
    );
  }
}
