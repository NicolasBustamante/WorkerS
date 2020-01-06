import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/models/trabajadorModel.dart';
import 'package:workers/core/viewmodels/CRUDTrabajador.dart';

class AddDataPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddDataState();
  }
}

class AddDataState extends State<AddDataPage>{
  final _formkey = GlobalKey<FormState>();
  String anos;
  String numCel;
  String cuentanos;
  String datosextras;

  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  String _googleToken;

  @override
  void initState() {
    currentUser().then((data) => setState((){ _googleToken = data;}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDTrabajador>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Datos Personales'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: ConstrainedBox(constraints: BoxConstraints(),
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: false,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Años de Experiencia',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por Favor, ingrese sus años de experiencia';
                        }
                        return null;
                      },
                      onSaved: (value) => anos = value),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      autofocus: false,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Número de Celular',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por Favor, ingrese su número de celular';
                        }
                        return null;
                      },
                      onSaved: (value) => numCel = value),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, cuentanos más sobre ti';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      initialValue: '',
                      maxLines: 12,
                      decoration: InputDecoration(
                        hintText: "Cuéntanos sobre ti",
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => cuentanos = value),
                  TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, cuentanos detalles extras';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      initialValue: '',
                      maxLines: 12,
                      decoration: InputDecoration(
                        hintText: "Detalles extras",
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => datosextras = value),
                  RaisedButton(
                    splashColor: Colors.lightGreen,
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        _formkey.currentState.save();
                        await productProvider.addTrabajador(Trabajador(
                            anos: anos,
                            numCel: numCel,
                            cuentanos: cuentanos,
                            datosextras: datosextras,
                            googleToken: _googleToken));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Agregar Datos', style: TextStyle(color: Colors.white)),
                    color: Colors.lightGreen,
                  )
                ],
              ),),
          )
        ),
      ),
    );
  }
}
