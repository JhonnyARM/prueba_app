import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suma de Números',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SumaScreen(),
    );
  }
}

class SumaScreen extends StatefulWidget {
  @override
  _SumaScreenState createState() => _SumaScreenState();
}

class _SumaScreenState extends State<SumaScreen> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suma de Números'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double num1 = double.parse(num1Controller.text);
                  double num2 = double.parse(num2Controller.text);
                  resultado = num1 + num2;
                });
              },
              child: Text('Sumar'),
            ),
            SizedBox(height: 20),
            Text(
              'El resultado es: $resultado',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }
}
