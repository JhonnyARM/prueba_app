import 'package:flutter/material.dart';

class UsandoListView extends StatefulWidget {
  const UsandoListView({super.key});

  @override
  State<UsandoListView> createState() => _UsandoListViewState();
}

class _UsandoListViewState extends State<UsandoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usando ListView"),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text("Esto es un ListTile estatico"),
              onTap: () {
                /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Placeholder())); */
              }),
          ElevatedButton(
              onPressed: () {},
              child: Text("[Elevatedbutton]Un listview puede tener")),
          TextButton(
              onPressed: () {},
              child: Text("[TextButton]Distintos widgets dentro")),
          OutlinedButton(
              onPressed: () {},
              child:
                  Text("[OutLinedButton]Lo que lo diferencia del column es")),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
          ListTile(
              title: Text(
                  "[ListTile]Es que un listview es interactivo y renderizable."),
              onTap: () {}),
          FloatingActionButton(
            onPressed: () {},
            child:
                Text("[FloatingActionButton] Column es vertical y estatico."),
          )
        ],
      ),
    );
  }
}
