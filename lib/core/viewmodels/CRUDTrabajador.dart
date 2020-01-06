import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:workers/core/models/trabajadorModel.dart';
import 'package:workers/core/services/api.dart';


class CRUDTrabajador extends ChangeNotifier {
  Api _api = new Api('trabajador');

  List<Trabajador> trabajador;

  Future<List<Trabajador>> fetchTrabajador() async {
    var result = await _api.getDataCollection();
    trabajador = result.documents.map((doc) => Trabajador.fromMap(doc.data, doc.documentID)).toList();
    return trabajador;
  }

  Stream<QuerySnapshot> fetchTrabajadorAsStream() {
    return _api.streamDataCollection();
  }

  Future<Trabajador> getTrabajadorById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Trabajador.fromMap(doc.data, doc.documentID);
  }

  Future removeTrabajador(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateTrabajador(Trabajador data, String id) async{
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addTrabajador(Trabajador data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }
}