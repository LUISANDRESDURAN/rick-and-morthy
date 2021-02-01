import 'package:flutter/material.dart';

import 'package:rick_and_morthy/src/models/personaje_model.dart';

class PersonajeHorizontal extends StatelessWidget {
  /*como debemos recibir una lista de peliculas pues lo declaramos de tipo
  final */
  final List<Caracteristica> peliculas;
  final Function siguientePagina;
  PersonajeHorizontal(
      {Key key, @required this.peliculas, @required this.siguientePagina})
      : super(key: key);

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

/*necesitamos hacer un listener para escuhar todos los cambios que suceden y asi podfer saber cunado
se acaba una pagina o se llega al final 

obtendremos la posicion en pixeles del _pageController*/
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        print('Cargar siguiente peliculas');
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.3,
/*este nuevo widget nos sirve para deslizar como paginas 
PAGE VIEW va a renderizar todos los elementos que contenga de manera simultanea
puede ser una posible falla de memoria


LA DIFERENCIA DEL PAGE VIEW Y EL PAGEVIEW.BUILDER es que el .builder los va a renderizar solo 
cuando sea necesario*/
      child: PageView.builder(
        pageSnapping: false,
        /*el page viwew tiene uin controlador que nos permite saber cuantas queremos mostrar
        en este caso con el viewPortFraction mostramos de a 3 */
        controller: _pageController,
        // children: _tarjetas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _tarjeta(
            context,
            peliculas[i],
          );
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Caracteristica pelicula) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          /*el clipRReact sirve para colocarle border circulares  */
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(pelicula.image),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          //  SizedBox()
          Text(
            pelicula.name,
            /*cuando no entra el nombre compelto este overflow
              coloca 3 puntos suspensivos para indicar que es largo */
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle2', arguments: pelicula);
        //print('id de la pelicula ${pelicula.gender}');
      },
    );
  }

  /*esta ya no se esta usando pero la dejare como referencia, esta es lo que ahorita hace  _tarjeta */
/*
  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            /*el clipRReact sirve para colocarle border circulares  */
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.image),
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
            //  SizedBox()
            Text(
              pelicula.name,
              /*cuando no entra el nombre compelto este overflow
              coloca 3 puntos suspensivos para indicar que es largo */
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }
  */
}
