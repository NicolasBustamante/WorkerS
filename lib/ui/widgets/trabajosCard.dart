import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';


class TrabajoCard extends StatelessWidget {
  final Trabajo trabajoDetails;

  CRUDModel crudModel = new CRUDModel();

  TrabajoCard({@required this.trabajoDetails});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => TrabajoCard(trabajoDetails: trabajoDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        trabajoDetails.titulo,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        trabajoDetails.descripcion,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0)
                        ),
                        minWidth: 200.0,
                        height: 42.0,
                        // Aceptación de trabajo
                        onPressed: () async {
                          String userid;
                          String titulo;
                          String descripcion;
                          String categoria;
                          FirebaseUser firebaseuser = await FirebaseAuth.instance.currentUser();
                          CRUDModel crudModel = new CRUDModel();
                          userid = firebaseuser.uid;
                          titulo = titulo;
                          descripcion = descripcion;
                          categoria = categoria;
                          crudModel.updateTrabajo(new Trabajo(
                            trabajadorid: userid, titulo: titulo, descripcion: descripcion, categoria: categoria
                          ), trabajoDetails.id);
                        },
                        color: Colors.lightGreen,
                        child: Text('Aceptar Trabajo',
                          style: TextStyle(
                            color: Colors.white
                          ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}