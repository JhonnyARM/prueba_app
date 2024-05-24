import 'package:flutter/material.dart';
import 'package:prueba_app/ListaView.dart';
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
      home: Menu(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontSize: 18),
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
        title: Text("Widgets"),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => TextBox())));
              },
              child: Text("TextBox"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Calculadora())));
              },
              child: Text("Calculadora"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyForm())));
              },
              child: Text("Formularios"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => UsandoListView())));
              },
              child: Text("ListViews"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CardExample())));
              },
              child: Text("Tarjetas|Card"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Registros())));
              },
              child: Text("RegistroDeParticipantes"),
            ),
          ),
          // Agrega más ElevatedButton con Padding según sea necesario
        ],
      )),
    );
  }
}
