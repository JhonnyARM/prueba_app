import 'package:flutter/material.dart';
import 'package:prueba_app/ListaView.dart';
import 'package:prueba_app/NewForm.dart';
import 'package:prueba_app/Register.dart';
import 'package:prueba_app/calculadora.dart';
import 'package:prueba_app/cards.dart';
import 'package:prueba_app/formulario.dart';
import 'package:prueba_app/practicando.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Menu(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        textTheme: TextTheme(
          bodyText1: const TextStyle(color: Colors.black, fontSize: 18),
          bodyText2: TextStyle(color: Colors.grey[600]),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String texto = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const TextBox())));
              },
              child: const Text("TextBox"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Calculadora())));
              },
              child: const Text("Calculadora"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const MyForm())));
              },
              child: const Text("Formularios"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const UsandoListView())));
              },
              child: const Text("ListViews"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CardExample())));
              },
              child: const Text("Tarjetas|Card"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Registros())));
              },
              child: const Text("RegistroDeParticipantes"),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NewForm()));
                },
                child: const Text("Formulario de lista a tarjeta"),
              )),
          // Agrega más ElevatedButton con Padding según sea necesario
        ],
      )),
    );
  }
}
