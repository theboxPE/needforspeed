import 'package:flutter/material.dart';


class AcercaDe extends StatelessWidget {
  const AcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de Need for Speed'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Need for Speed: La película',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Género: Acción, Suspenso',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Director: Scott Waugh',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Guionistas: John Gatins, George Gatins',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Basado en la serie de videojuegos Need for Speed de Electronic Arts',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Fecha de estreno: 14 de marzo de 2014',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Reparto:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Aaron Paul como Tobey Marshall',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Rami Malek como Dino Brewster',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Dominic Cooper como Julian "Hawk" Hawkins',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Imogen Poots como Julia Maddon',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Scott "Kid Cudi" Mescudi como Benny "Maverick" Collins',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Dakota Johnson como Anita Coleman',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Michael Keaton como Monarch',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '* Harrison Gilbertson como Pete "Little Pete" Coleman',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Sinopsis:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'El corredor callejero Tobey Marshall se embarca en una carrera contrarreloj como una forma de vengar la muerte de su amigo a manos de un corredor rival, Dino Brewster.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}