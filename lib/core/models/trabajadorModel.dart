class Trabajador {
  String id;
  String anos;
  String numCel;
  String cuentanos;
  String datosextras;
  String categoria;
  String googleToken;

  Trabajador({this.id, this.anos, this.numCel, this.cuentanos, this.datosextras, this.googleToken});

  Trabajador.fromMap(Map snapshot,String id) :
        id = id ?? '',
        anos = snapshot['anos'] ?? '',
        numCel = snapshot['numCel'] ?? '',
        cuentanos = snapshot['cuentanos'] ?? '',
        datosextras = snapshot['datosextras'] ?? '';

  toJson() {
    return {
      "años": anos,
      "numCel": numCel,
      "cuentanos": cuentanos,
      "datosextras": datosextras,
      "googleToken": googleToken
    };
  }
}