import 'package:flutter/material.dart';

class Registros extends StatefulWidget {
  const Registros({super.key});

  @override
  State<Registros> createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  /* final _formKey = GlobalKey<FormState>(); */
  List<Map<String, dynamic>> personas = [];
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de personas"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(labelText: "Nombre"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nombre requerido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(labelText: "Apellido"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Apellido requerido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // añadimos valores al mapa.
                              personas.add({
                                'nombre': name.text.toString(),
                                'apellido': lastName.text.toString()
                              });
                              // Aquí puedes enviar o procesar los datos del formulario
                              // En este ejemplo, solo mostramos un diálogo con el nombre ingresado
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("NUEVO REGISTRO"),
                                    content:
                                        Text(name.text + " " + lastName.text),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Cerramos el cuadro de dialogo en el contexto actual
                                          },
                                          child: Text("Cerrar"))
                                    ],
                                  );
                                },
                              );
                              /* showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Registro exitoso'),
                                    content: Text(name.text + " " + lastName.text),
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
                              ); */
                            }
                          },
                          child: Text("Registrar")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Listando(personas: personas),
                                ));
                          },
                          child: Text("Listar")),
                    ],
                  ),
                ],
              ))),
    );
  }
}

class Listando extends StatefulWidget {
  final List<Map<String, dynamic>>
      personas; // se declara la variable dentro de la clase.
  const Listando(
      {super.key,
      required this.personas}); // se define que se espera esta variable.

  @override
  State<Listando> createState() => _ListandoState();
}

class _ListandoState extends State<Listando> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listando con tarjetas"),
      ),
      body: ListView.builder(
        itemCount: widget.personas.length,
        itemBuilder: (BuildContext context, int index) {
          final persona = widget.personas[index];
          return Card(
              child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Nombre: ${persona['nombre']}'),
            subtitle: Text('Apellido: ${persona['apellido']}'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Vista rapida"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Name: ${persona['nombre']}'),
                          Text('LastName: ${persona['apellido']}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cerrar"))
                      ],
                    );
                  });

              /* showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("NUEVO REGISTRO"),
                    content: Text(name.text + " " + lastName.text),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Cerramos el cuadro de dialogo en el contexto actual
                          },
                          child: Text("Cerrar"))
                    ],
                  );
                },
              ); */
            },
          ));
        },
      ),
    );
  }
}
/* return ListTile(
            title: Text('Nombre: ${user['nombre']}'),
            subtitle: Text('Password: ${user['password']}'),
          ); */