import 'package:flutter/material.dart';

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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Configuración"),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}