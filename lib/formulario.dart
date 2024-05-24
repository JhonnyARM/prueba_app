import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // almacenando datos en un Mapa, luego sera usado para ser listado.
  List<Map<String, dynamic>> users = [];
  /* Map<String, String> users = {}; */

  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController pw = TextEditingController();
  String nombres = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: pw,
                    decoration: InputDecoration(
                      labelText:
                          'Contraseña', // Cambiado de 'Nombre' a 'Contraseña'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingresa tu contraseña';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nombres = name.text;
                        });
                        if (users.isEmpty) {
                          print("Lista vacia");
                        } else {
                          for (var usuario in users) {
                            print(usuario.toString());
                          }
                        }
                        if (_formKey.currentState!.validate()) {
                          // añadimos valores al mapa.
                          users.add({
                            'nombre': name.text.toString(),
                            'password': pw.text.toString()
                          });
                          // Aquí puedes enviar o procesar los datos del formulario
                          // En este ejemplo, solo mostramos un diálogo con el nombre ingresado
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Datos ingresados'),
                                content: Text(name.text + " " + pw.text),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cerrar'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text("Enviar")),
                  Text(
                    'El resultado es : $nombres',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerMapa(users: users)));
                },
                child: Text("PasarLista"))
          ],
        ),
      ),
    );
  }
}

class VerMapa extends StatefulWidget {
  final List<Map<String, dynamic>>
      users; // se añade una final con la lista o el objeto pasado
  const VerMapa(
      {super.key,
      required this.users}); // es necesario añadir tambien a la variable creada por el stl

  @override
  State<VerMapa> createState() => _VerMapaState();
}

class _VerMapaState extends State<VerMapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listando usuarios"),
      ),
      body: ListView.builder(
        itemCount: widget.users.length, // aca insertamos la lista de mapas
        itemBuilder: (BuildContext context, int index) {
          final user = widget.users[index];
          return ListTile(
            title: Text('Nombre: ${user['nombre']}'),
            subtitle: Text('Password: ${user['password']}'),
          );
        },
      ),
    );
  }
}
