import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';
import 'package:workers/ui/widgets/trabajosCard.dart';

class TrabajoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TrabajoState();
  }
}

class TrabajoState extends State<TrabajoPage>{
  List<Trabajo> trabajos;
  @override
  Widget build(BuildContext context) {
    final TrabajoProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Trabajos Disponibles"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: StreamBuilder(
            stream: TrabajoProvider.fetchTrabajoAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                trabajos = snapshot.data.documents
                    .map((doc) => Trabajo.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: trabajos.length,
                  itemBuilder: (buildContext, index) =>
                      TrabajoCard(trabajoDetails: trabajos[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
        ),
      );
  }
}