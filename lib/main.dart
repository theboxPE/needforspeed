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
          title: const Text('Presentacion'),
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
              'Presentacion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Gabriel',
              style: TextStyle(fontSize: 16, color: Colors.lightBlue),
            ),
            const SizedBox(height: 30.0),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Personajes'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Personajes(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Momentos'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Momentos(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('Acerca De'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AcercaDe(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('Mi Vida'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MiVida(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
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