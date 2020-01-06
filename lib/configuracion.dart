import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workers/first-page.dart';

class ConfiguracionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ConfiguracionState();
  }
}

class ConfiguracionState extends State<ConfiguracionPage>{

  @override
  Widget build(BuildContext context) {

    final signOut = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightGreen.shade100,
        elevation: 5.0,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
            minWidth: 200.0,
            height: 42.0,
            onPressed: () {
              signOutGoogle();
            },
            color: Colors.lightGreen,
            child: Text('Cerrar Sesión', style: TextStyle(color: Colors.black))
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text("Configuración"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            signOut,
          ],
        ),
      ),
    );
  }

  void signOutGoogle() async {
    FirebaseAuth.instance.signOut().then((data){
      GoogleSignIn().signOut().then((data){
        Navigator.of(context).pushNamed('/first-page');
      });
    }).catchError((e){
      print(e);
    });
  }

}