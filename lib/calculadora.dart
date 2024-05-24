import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController a = TextEditingController();
  final TextEditingController b = TextEditingController();
  final TextEditingController c = TextEditingController();
  final TextEditingController d = TextEditingController();
  double resultado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
        ),
        body: Column(children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: a,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Número 1'),
                ),
                TextField(
                  controller: b,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Número 2'),
                ),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      double x = double.parse(a.text);
                      double y = double.parse(b.text);
                      resultado = x + y;
                    });
                  },
                  child: const Text("Sumar"),
                ),
                SizedBox(height: 20),
                Text(
                  'El resultado es : $resultado',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ]));
  }
}
