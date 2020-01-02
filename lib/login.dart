import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginMenu extends StatefulWidget{
  /*static String tag = 'login-page';
  LoginMenu({Key, key, this.title}): super(key: key);

  final String title; */
  @override
  _LoginMenuState createState() => _LoginMenuState();

}

class _LoginMenuState extends State<LoginMenu>{
  @override
  Widget build(BuildContext context) {

    /* final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'nicolasbustamantealfaro@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final loginButton = Padding(
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
              Navigator.of(context).pushNamedAndRemoveUntil('/home-page', (Route<dynamic> route)=>false);
            },
            color: Colors.lightGreen,
            child: Text('Ingresar', style: TextStyle(color: Colors.black))
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Olvido su Contraseña?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );


    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                loginButton,
                forgotLabel
              ],
            )
        )
    );*/
  }
}