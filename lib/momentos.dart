import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
          FichaMomento(
            name: 'Muerte de pete',
            image: 'assets/accidente.jpg',
            descripcion: 'Momento en el que pasa el accidente del koenigsegg agera blanco en el que iba ',
            video: 'https://www.youtube.com/watch?v=1wX22heflW4',
          ),
          FichaMomento(
            name: 'exhibición del ford mustang',
            image: 'assets/vehiculo.jpg',
            descripcion: 'Es cuando se esta mostrando el vehiculo luego de una reparacion y Julia dice todos los detalles del coche sin verlo luego de modificado',
            video: 'https://www.youtube.com/watch?v=YrRqYPWHgK8',
          ),
          FichaMomento(
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
  final String name;
  final String descripcion;
  final String image;
  final String video;

  const FichaMomento({
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerWidget(videoUrl: videoUrl),
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

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
