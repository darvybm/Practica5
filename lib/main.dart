import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cambiador de texto y Forma',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayText = '¡Hola, Mundo!';
  double containerSize = 100.0;
  Color containerColor = Colors.green;
  double borderRadius = 20.0; // Inicializar el radio del borde

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: const Text('Cambiador'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.green,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              displayText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeTextAndBox,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color de fondo del botón
              ),
              child: const Text('Cambiar Texto y Cuadro'),
            ),
            const SizedBox(height: 20),
            Container(
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(borderRadius), // Borde redondeado
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeTextAndBox() {
    setState(() {
      displayText = (displayText == '¡Hola, Mundo!') ? 'Adiós Mundo Cruel' : '¡Hola, Mundo!';
      containerSize = Random().nextDouble() * 300 + 50;
      containerColor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1.0);
      borderRadius = Random().nextDouble() * 50; 
    });
  }
}
