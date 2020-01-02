import 'package:flutter/material.dart';

class TrabajoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TrabajoState();
  }
}

class TrabajoState extends State<TrabajoPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Trabajos Disponibles"),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}