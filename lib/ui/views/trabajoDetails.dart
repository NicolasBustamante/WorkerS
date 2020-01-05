import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';

class trabajoDetails extends StatelessWidget {
  final Trabajo trabajo;

  trabajoDetails({@required this.trabajo});

  @override
  Widget build(BuildContext context) {
    final trabajoProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Trabajo'),
        actions: <Widget>[

          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await trabajoProvider.removeTrabajo(trabajo.id);
              Navigator.pop(context) ;
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> (trabajoDetails(trabajo: trabajo))));
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            trabajo.titulo,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Text(
            '${trabajo.descripcion} \$',
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