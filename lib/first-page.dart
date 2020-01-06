import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workers/home.dart';
import 'package:workers/ui/views/addPerfilView.dart';

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstState();
  }
}

class FirstState extends State<FirstPage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightGreen.shade100,
        elevation: 5.0,
        child: MaterialButton(
            shape: RoundedRectangleBorder(

            ),
            minWidth: 200.0,
            height: 42.0,
            onPressed: () {
             // _handleSignIn().whenComplete(() {

             // });
              _handleSignIn().then((FirebaseUser user){
                print('usuario - $user');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return (AddPerfil());
                    },
                  ),
                );
              }).catchError((e) => print(e));
            },
            color: Colors.lightGreen,
            child: Text('Ingresar', style: TextStyle(color: Colors.black))
        ),
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
            shape: RoundedRectangleBorder(

            ),
            minWidth: 200.0,
            height: 42.0,
            onPressed: () {
              Navigator.of(context).pushNamed('/registro-page');
            },
            color: Colors.lightGreen,
            child: Text('Registrarse', style: TextStyle(color: Colors.black))
        ),
      ),
    );

    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Container(
                  height: 90,
                  width: 130,
                  child: Image(
                    image: AssetImage('./assets/images/workers.png'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(24, 60, 24, 24),
                    child: loginButton)
              ],
            )
        )
    );
  }
}