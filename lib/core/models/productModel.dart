class Trabajo {
  String id;
  String titulo;
  String descripcion;
  String archivo;
  String estado;
  String categoria;
  String trabajadorid;

  Trabajo({this.id, this.titulo, this.descripcion, this.archivo, this.estado, this.categoria, this.trabajadorid});

  Trabajo.fromMap(Map snapshot,String id) :
      id = id ?? '',
      titulo = snapshot['titulo'] ?? '',
      descripcion = snapshot['descripcion'] ?? '',
      archivo = snapshot['archivo'] ?? '',
      estado = snapshot['estado'] ?? '',
      categoria = snapshot['categoria'] ?? '',
      trabajadorid = snapshot['trabajadorid'] ?? '';

  toJson() {
   return {
     "titulo": titulo,
     "descripcion": descripcion,
     "estado": estado,
     "categoria": categoria,
     "trabajadorid": trabajadorid,
   };
  }
}