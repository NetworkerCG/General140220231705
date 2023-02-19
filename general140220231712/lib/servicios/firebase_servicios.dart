import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore basedatos = FirebaseFirestore.instance;

Future<List> getPersonas() async {
  //lista de personas requeridas en la funcion
  List personas = [];
  //llamado a base de datos
  CollectionReference collectionReferencePersonas =
      basedatos.collection('Persona');
  //trae todos los documentos de la base de datos
  QuerySnapshot queryPersona = await collectionReferencePersonas.get();
  //iteracion para cada uno de los documentos
  for (var documento in queryPersona.docs) {
    final Map<String, dynamic> datos = documento.data() as Map<String, dynamic>;
    final persona = {"nombreP": datos['nombreP'], "id": documento.id};

    //se agrega los datos a la lista que vienen de los documentos de la base de datos
    personas.add(persona);
  }
  return personas;
}

Future<void> agregarPersonas(String nombre) async {
  await basedatos.collection("Persona").add({"nombreP": nombre});
}

Future<void> actualizarPersonas(String id, String nuevoNombre) async {
  await basedatos.collection("Persona").doc(id).set({"nombreP": nuevoNombre});
}

Future<void> eliminarPersonas(String id) async {
  await basedatos.collection("Persona").doc(id).delete();
}
