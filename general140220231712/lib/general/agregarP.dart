import 'package:flutter/material.dart';

class AgregarP extends StatefulWidget {
  AgregarP({Key? key}) : super(key: key);

  @override
  State<AgregarP> createState() => _AgregarPState();
}

class _AgregarPState extends State<AgregarP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Nombre"),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Ingrese el nombre:',
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Guardar"))
        ],
      ),
    );
  }
}
