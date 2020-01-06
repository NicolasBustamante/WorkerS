import 'package:cloud_firestore/cloud_firestore.dart';

class Api{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;
  Api( this.path ) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  // trabajo activo, arturo agregar estado a trabajos publicados
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.where('estado', isEqualTo: 'activo').snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data);
  }
}