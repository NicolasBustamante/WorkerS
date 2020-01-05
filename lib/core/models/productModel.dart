class Trabajo {
  String id;
  String titulo;
  String descripcion;
  String archivo;
  String estado;
  String categoria;

  Trabajo({this.id, this.titulo, this.descripcion, this.archivo, this.estado, this.categoria});

  Trabajo.fromMap(Map snapshot,String id) :
      id = id ?? '',
      titulo = snapshot['titulo'] ?? '',
      descripcion = snapshot['descripcion'] ?? '',
      archivo = snapshot['archivo'] ?? '',
      estado = snapshot['estado'] ?? '',
      categoria = snapshot['categoria'] ?? '';

  toJson() {
   return {
     "titulo": titulo,
     "descripcion": descripcion,
     "archivo": archivo,
     "estado": estado,
     "categoria": categoria
   };
  }
}