import 'package:flutter/material.dart';
import 'personajes.dart';
import 'momentos.dart';
import 'acercade.dart';
import 'mivida.dart';
import 'contacto.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text('Need for Speed'),
        ),
        body: const Center(
          child: Text('Saludos Usuario'),
        ),
      ),
    );
  }
}


class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const Text(
              'Need for Speed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Gabriel',
              style: TextStyle(fontSize: 16, color: Colors.lightBlue),
            ),
            const im(
              'Gabriel',
            ),
            const SizedBox(height: 30.0),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Personajes'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Personajes(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Momentos'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Momentos(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca De'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AcercaDe(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Mi Vida'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MiVida(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_center),
              title: const Text('Contacto'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Contacto(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}