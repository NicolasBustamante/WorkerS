import 'package:flutter/material.dart';
import 'package:workers/core/models/perfilModel.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/CRUDPerfil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workers/first-page.dart';



class AddPerfil extends StatefulWidget {
  @override
  _AddPerfilState createState() => _AddPerfilState();
}

class _AddPerfilState extends State<AddPerfil> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;


    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential))
        .user;
    print("signed in " + user.displayName);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    // Checking if email and name is null
    assert(user.email != null);

    return user;
  }

  final _formKey = GlobalKey<FormState>();
  String nombre ;
  String apellido ;
  String tipoUsuario = 'trabajador';
  String googleToken;
  String categoria;



  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDPerfil>(context) ;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text('Datos de Trabajador'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nombre',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, ingrese su nombre';
                    }
                    return null;
                  },
                  onSaved: (value) => nombre = value
              ),
              TextFormField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Apellido',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, ingrese su apellido';
                    }
                    return null;
                  },
                  onSaved: (value) => apellido = value
              ),

              DropdownButton<String>(
                value: categoria,
                onChanged: (String newValue) {
                  setState(() {
                    categoria = newValue;
                  });
                },
                items: <String>['Construccion', 'Electricidad', 'Albañileria', 'Gasfitería','Electronica'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),


              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _handleSignIn().then((FirebaseUser user) async{
                      final googleToken = user.uid;
                      await productProvider.addPerfil(Perfil(nombre: nombre, apellido: apellido, tipoUsuario: tipoUsuario, categoria: categoria.toString(), googleToken: googleToken));
                      Navigator.pushNamed(context, '/home-page');
                    }
                    );
                  }
                },
                child: Text('Guardar Datos', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}



