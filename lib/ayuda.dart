import 'package:flutter/material.dart';

class Ayuda extends StatelessWidget{
  static String tag = 'ayuda-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ayuda"),
          backgroundColor: Colors.lightGreen,
        ),
      body: Center(
        child: Text("Por el momento no contamos con Soporte Directo, pero puedes escribirnos a works-dev@gmail.com",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),)
      )
    );
  }
}