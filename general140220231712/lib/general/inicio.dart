import 'package:flutter/material.dart';
import 'package:general140220231712/servicios/firebase_servicios.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getPersonas(),
          builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]['nombreP']),
                    onTap: () async {
                      await Navigator.pushNamed(context, '/editarP',
                          arguments: {
                            "nombreP": snapshot.data?[index]['nombreP'],
                            "id": snapshot.data?[index]['id']
                          });
                      setState(() {});
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, '/agregarP');
          setState(() {});
        },
      ),
    );
  }
}
