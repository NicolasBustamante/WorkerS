import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/models/productModel.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';


class ModifyTrabajo extends StatefulWidget {
  final Trabajo trabajo;

  ModifyTrabajo({@required this.trabajo});

  @override
  _ModifyTrabajoState createState() => _ModifyTrabajoState();
}

class _ModifyTrabajoState extends State<ModifyTrabajo> {
  final _formKey = GlobalKey<FormState>();

  String titulo ;

  String descripcion ;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
      appBar: AppBar(
        title: Center(
          child: Text('Modify Product Details'),
        ),
      );
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.trabajo.titulo,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Product Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Product Title';
                    }
                    return null;
                  },
                  onSaved: (value) => titulo = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.trabajo.descripcion,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                    return null;
                  },
                  onSaved: (value) => descripcion = value
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updateTrabajo(Trabajo(titulo: titulo,descripcion: descripcion),widget.trabajo.id);
                    Navigator.pop(context) ;
                  }
                },
                child: Text('Modify Product', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      );
  }
}