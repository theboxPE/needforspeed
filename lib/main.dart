import 'package:flutter/material.dart';
import 'navbar.dart';

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

