import 'package:flutter/material.dart';

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
            nombre: 'Muerte de ',
            imagen: 'assets/accidente.jpg',
            descripcion: 'Detalle de los momentos de Juan',
            videoUrl: 'https://www.youtube.com/watch?v=video_id_1',
          ),
          FichaProducto(
            nombre: 'Pedro',
            imagen: 'assets/foto_pedro.jpg',
            descripcion: 'Detalle de los momentos de Pedro',
            videoUrl: 'https://www.youtube.com/watch?v=video_id_2',
          ),
          FichaProducto(
            nombre: 'Carlos',
            imagen: 'assets/foto_carlos.jpg',
            descripcion: 'Detalle de los momentos de Carlos',
            videoUrl: 'https://www.youtube.com/watch?v=video_id_3',
          ),
        ],
      ),
    );
  }
}

class FichaProducto extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String imagen;
  final String videoUrl;

  const FichaProducto({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleMomento(
              nombre: nombre,
              descripcion: descripcion,
              imagen: imagen,
              videoUrl: videoUrl,
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
                imagen,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
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
