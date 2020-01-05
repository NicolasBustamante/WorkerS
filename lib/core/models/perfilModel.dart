class Perfil {
  String id;
  String nombre;
  String apellido;
  String categoria;
  String tipoUsuario;
  String googleToken;

  Perfil({this.id, this.nombre, this.apellido, this.categoria, this.tipoUsuario, this.googleToken});

  Perfil.fromMap(Map snapshot,String id) :
      id = id ?? '',
      nombre = snapshot['nombre'] ?? '',
      apellido = snapshot['apellido'] ?? '',
      categoria = snapshot['categoria'] ?? '',
      tipoUsuario = snapshot['tipoUsuario'] ?? '',
      googleToken = snapshot['googleToken'] ?? '';

  toJson() {
    return {
      "nombre": nombre,
      "apellido": apellido,
      "tipoUsuario": tipoUsuario,
      "googleToken": googleToken,
      "categoria": categoria,
    };
  }
}