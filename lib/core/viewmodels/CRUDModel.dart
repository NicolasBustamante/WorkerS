import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:workers/core/models/perfilModel.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/services/api.dart';
import 'package:workers/locator.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Trabajo> trabajos;

  Future<List<Trabajo>> fetchTrabajo() async {
    var result = await _api.getDataCollection();
    trabajos = result.documents.map((doc) => Trabajo.fromMap(doc.data, doc.documentID)).toList();
    return trabajos;
  }

  Stream<QuerySnapshot> fetchTrabajoAsStream() {
    return _api.streamDataCollection();
  }

  Future<Trabajo> getTrabajoById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Trabajo.fromMap(doc.data, doc.documentID);
  }

  Future removeTrabajo(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateTrabajo(Trabajo data, String id) async{
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addTrabajo(Trabajo data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }
}