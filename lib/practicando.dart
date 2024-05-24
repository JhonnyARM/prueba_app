import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  const TextBox({super.key});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  final TextEditingController _text = TextEditingController();
  String texto = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APPBAR: capturando datos"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _text,
              decoration: InputDecoration(labelText: "Ingrese un texto"),
            ),
            ElevatedButton(
              onPressed: () {
                texto = _text.text;
                print(texto);
              },
              child: Text("Hijo de elevatedbutton, es un texto"),
            ),
          ],
        ),
      ),
    );
  }
}
