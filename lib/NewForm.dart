import 'package:flutter/material.dart';

class NewForm extends StatefulWidget {
  const NewForm({super.key});

  @override
  State<NewForm> createState() => _NewFormState();
}

class _NewFormState extends State<NewForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> nombre = [];
  List<String> apellido = [];
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario con lista"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingresar nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(labelText: 'Apellido'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingresar apellido';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          nombre.add(name.text.toString());
                          apellido.add(lastName.text.toString());
                          print(nombre);
                          print(apellido);
                        }
                      },
                      child: Text("Send")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerListado(
                                    nombre: nombre, apellido: apellido)));
                      },
                      child: Text('VerLista')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerListado extends StatefulWidget {
  final List<String> nombre;
  final List<String> apellido;
  const VerListado(
      {super.key,
      required this.nombre,
      required this.apellido}); // VA DENTRO DE LA LLAVE los required {}

  @override
  State<VerListado> createState() => _VerListadoState();
}

class _VerListadoState extends State<VerListado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listando con tarjetas')),
      body: ListView.builder(
        itemCount: widget.nombre.length,
        itemBuilder: (BuildContext context, int index) {
          final name = widget.nombre[index];
          final lastName = widget.apellido[index];
          return Card(
              color: Color.fromARGB(255, 149, 224, 234),
              child: ListTile(
                leading: Icon(Icons.person),
                title: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Nombre: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight:
                                FontWeight.bold), // Estilo para 'Nombre: '
                      ),
                      TextSpan(
                        text: name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w900,
                          fontStyle:
                              FontStyle.italic, // Texto de name en negrita
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Text('Apellido: $lastName'),
              ));
        },
      ),
    );
  }
}
/* body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form( */