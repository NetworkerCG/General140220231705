import 'package:flutter/material.dart';
import 'package:general140220231712/servicios/firebase_servicios.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: FutureBuilder(
      //     future: getPersonas(),
      //     builder: ((context, snapshot) {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) {
      //           return Text(snapshot.data?[index]['nombreP']);
      //         },
      //       );
      //     })),
      body: Text("Hola Mundo"),
    );
  }
}
