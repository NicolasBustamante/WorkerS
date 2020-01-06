import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';
import 'package:workers/core/viewmodels/CRUDPerfil.dart';
import 'package:workers/ui/widgets/trabajosCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TrabajoPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return TrabajoState();
  }
}


class TrabajoState extends State<TrabajoPage>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  String _googleToken;

  List<Trabajo> trabajos;
  @override
  void initState() {
    currentUser().then((data) =>
        setState(() {
          _googleToken = data;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TrabajoProvider = Provider.of<CRUDModel>(context);
    final perfilProvider = Provider.of<CRUDPerfil>(context);

    var categoria = perfilProvider.getCategoriaPerfilById(_googleToken).toString();


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