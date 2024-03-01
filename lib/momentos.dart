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
        children: const [
          FichaMomento(
            index: 0,
            name: 'Muerte de pete',
            image: 'assets/accidente.jpg',
            descripcion: 'Momento en el que pasa el accidente del koenigsegg agera blanco en el que iba ',
            video: 'https://www.youtube.com/watch?v=1wX22heflW4',
          ),
          FichaMomento(
            index: 1,
            name: 'exhibición del ford mustang',
            image: 'assets/vehiculo.jpg',
            descripcion: 'Es cuando se esta mostrando el vehiculo luego de una reparacion y Julia dice todos los detalles del coche sin verlo luego de modificado',
            video: 'https://www.youtube.com/watch?v=YrRqYPWHgK8',
          ),
          FichaMomento(
            index: 2,
            name: 'La carrera de Leon',
            image: 'assets/rojo.jpg',
            descripcion: 'Es cuando tobey mashall se enfrenta a dino el bambino con el carro que el mismo dino escondio luego del accidente de pete',
            video: 'https://www.youtube.com/watch?v=UQt34_Yfywk',
          ),
        ],
      ),
    );
  }
}

class FichaMomento extends StatelessWidget {
  final int index;
  final String name;
  final String descripcion;
  final String image;
  final String video;

  const FichaMomento({
    super.key, 
    required this.index,
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
              index: index,
              nombre: name,
              descripcion: descripcion,
              imagen: image,
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
  final int index;
  final String nombre;
  final String descripcion;
  final String imagen;
  final List<String> videos = [
    'https://www.youtube.com/watch?v=1wX22heflW4',
    'https://www.youtube.com/watch?v=YrRqYPWHgK8',
    'https://www.youtube.com/watch?v=UQt34_Yfywk',
  ];

  DetalleMomento({
    super.key, 
    required this.index,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    final String videoUrl = videos[index];
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlayerWidget(videoUrl: videoUrl),
                ),
              );
            },
            child: const Text('Ver Video'),
          ),
        ],
      ),
    );
  }
}

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;

  const YoutubePlayerWidget({super.key, required this.videoUrl});

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            // Implement your custom logic
          },
          onEnded: (metaData) {
            // Implement your custom logic
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(
    home: Momentos(),
  ));
}

