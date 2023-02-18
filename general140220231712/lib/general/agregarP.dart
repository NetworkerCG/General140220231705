import 'package:flutter/material.dart';
import 'package:general140220231712/servicios/firebase_servicios.dart';

class AgregarP extends StatefulWidget {
  AgregarP({Key? key}) : super(key: key);

  @override
  State<AgregarP> createState() => _AgregarPState();
}

class _AgregarPState extends State<AgregarP> {
  TextEditingController nombreController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Nombre"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre:',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  //print(nombreController.text);
                  await agregarPersonas(nombreController.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
