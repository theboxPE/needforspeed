import 'package:flutter/material.dart';

class Personaje {
  String name;
  String image;
  String details;

  Personaje({required this.name, required this.image, required this.details});
}
class Personajes extends StatelessWidget {
  const Personajes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Momentos'),
      ),
      body: ListView(
        children: <Widget>[
          FichaPersonaje(
            personaje: Personaje(
              name: 'Tobey Marshall',
              image: 'assets/tobey.jpg',
              details: 'Es un mecánico de cuello azul y expiloto de carreras experto de Mount Kisco, Nueva York, que está incriminado por un delito federal que no cometió.',
            ),
          ),
          FichaPersonaje(
            personaje: Personaje(
              name: 'Julia Maddon',
              image: 'assets/Julia.jpg',
              details: 'Es una experta corredora de autos británica que se convierte en el interés amoroso de Tobey Marshall',
            ),
          ),
          FichaPersonaje(
            personaje: Personaje(
              name: 'Dino Brewster',
              image: 'assets/dino.jpg',
              details: 'Es un ex corredor que saltó a las ligas mayores en las 500 Millas de Indianápolis y el feroz rival de Tobey, quien lo incriminó tras haber matado a su amigo Pete en medio de una carrera.',
            ),
          ),
        ],
      ),
    );
  }
}

class FichaPersonaje extends StatelessWidget {
  final Personaje personaje;

  const FichaPersonaje({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetallePersonaje(personaje: personaje),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 85,
          width: 95,
          child: Row(
            children: <Widget>[
              Image.asset(
                personaje.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(personaje.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetallePersonaje extends StatelessWidget {
  final Personaje personaje;

  const DetallePersonaje({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personaje.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                personaje.image,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                personaje.details,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

