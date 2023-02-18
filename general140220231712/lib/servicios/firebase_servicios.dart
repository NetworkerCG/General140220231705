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
  queryPersona.docs.forEach((documento) {
    //se agrega los datos a la lista que vienen de los documentos de la base de datos
    personas.add(documento.data());
  });
  return personas;
}

Future<void> agregarPersonas(String nombre) async {
  await basedatos.collection("Persona").add({"nombreP": nombre});
}
