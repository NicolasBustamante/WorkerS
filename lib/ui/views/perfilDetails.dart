import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/models/perfilModel.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';
import 'package:workers/core/viewmodels/CRUDPerfil.dart';

class perfilDetails extends StatelessWidget {
  final Perfil perfil;

  perfilDetails({@required this.perfil});

  @override
  Widget build(BuildContext context) {
    final perfilProvider = Provider.of<CRUDPerfil>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Perfil'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            perfil.categoria,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Text(
            '${perfil.nombre} \$',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }
}