import 'package:flutter/material.dart';

class datosPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return datosState();
  }
}

class datosState extends State<datosPage>{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Datos Profesionales"),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
