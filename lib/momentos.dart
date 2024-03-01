import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Momentos extends StatelessWidget {
  const Momentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Momentos'),
      ),
      body: ListView(
        children: const <Widget>[
          FichaProducto(
            name: 'Muerte de ',
            image: 'assets/accidente.jpg',
            descripcion: 'Momento en el que pasa el accidente del koenigsegg agera blanco en el que iba ',
            video: 'www.youtube.com/embed/1wX22heflW4?si=wlo45J0snhYAcY8T',
          ),
          FichaProducto(
            name: 'exhibición del ford mustang',
            image: 'assets/vehiculo.jpg',
            descripcion: 'Es cuando se esta mostrando el vehiculo luego de una reparacion y Julia dice todos los detalles del coche sin verlo luego de modificado',
            video: 'https://www.youtube.com/watch?v=video_id_2',
          ),
          FichaProducto(
            name: 'La carrera de Leon',
            image: 'assets/rojo.jpg',
            descripcion: 'Es cuando tobey mashall se enfrenta a dino el bambino con el carro que el mismo dino escondio luego del accidente de ',
            video: 'https://www.youtube.com/watch?v=video_id_3',
          ),
        ],
      ),
    );
  }
}

class FichaProducto extends StatelessWidget {
  final String name;
  final String descripcion;
  final String image;
  final String video;

  const FichaProducto({
    super.key,
    required this.name,
    required this.descripcion,
    required this.image,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleMomento(
              nombre: name,
              descripcion: descripcion,
              imagen: image,
              videoUrl: video,
            ),
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
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetalleMomento extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String imagen;
  final String videoUrl;

  const DetalleMomento({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagen,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              descripcion,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Abrir el video en un reproductor de video
            },
            child: const Text('Ver Video'),
          ),
        ],
      ),
    );
  }
}
