import 'package:flutter/material.dart';
import 'package:general140220231712/servicios/firebase_servicios.dart';

class EditarP extends StatefulWidget {
  EditarP({Key? key}) : super(key: key);

  @override
  State<EditarP> createState() => _EditarPState();
}

class _EditarPState extends State<EditarP> {
  TextEditingController nombreController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nombreController.text = arguments['nombreP'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Nombre"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificacion:',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await actualizarPersonas(
                          arguments['id'], nombreController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
