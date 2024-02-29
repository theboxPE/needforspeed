import 'package:flutter/material.dart';

class Personaje {
  String name;
  String image;
  String details;

  Personaje({required this.name, required this.image, required this.details});
}

class Personajes extends StatelessWidget {
  Personajes({super.key});

  final List<Personaje> characters = [
    Personaje(
      name: 'Tobey Marshall',
      image: 'assets/tobey.jpg',
      details: 'Es un mecánico de cuello azul y expiloto de carreras experto de Mount Kisco, Nueva York, que está incriminado por un delito federal que no cometió.',
    ),
    Personaje(
      name: 'Julia Maddon',
      image: 'assets/Julia.jpg',
      details: 'Es una experta corredora de autos británica que se convierte en el interés amoroso de Tobey Marshall',
    ),
    Personaje(
      name: 'Dino Brewster',
      image: 'assets/dino.jpg',
      details: 'Es un ex corredor que saltó a las ligas mayores en las 500 Millas de Indianápolis y el feroz rival de Tobey, quien lo incriminó tras haber matado a su amigo Pete en medio de una carrera.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPersonajes(characters: characters),
    );
  }
}

class ListPersonajes extends StatelessWidget {
  final List<Personaje> characters;

  const ListPersonajes({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(characters[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetailScreen(character: characters[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CharacterDetailScreen extends StatelessWidget {
  final Personaje character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                character.image,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                character.details,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

