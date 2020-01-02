import 'package:flutter/material.dart';


class HistorialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HistorialState();
  }
}

class HistorialState extends State<HistorialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text("Historial"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Tu Balance",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$3.750",
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius:
                            BorderRadius.all(const Radius.circular(4.0)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Pago Programado para: 10/01',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Si el monto es superior a \$1.000 este sera depositado a su Cuenta Bancaria",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(26),
              width: double.infinity,
              color: Colors.black12,
              child: Text(
                "Trabajos Realizados",
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Arreglo Cañeria", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("\$5.000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Dic 29, 10:13 AM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                      Text("\$-1.250", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}