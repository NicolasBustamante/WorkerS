import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}



class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}



class HomeState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ("WorkerS"),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {Navigator.of(context).pushNamed('/notificaciones-page');},
              color: Colors.white,
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Busca trabajos disponibles en tu Área",
                            style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {Navigator.pushNamed(context, "/trabajos-page");},
                        child: Container(
                          width: 300,
                          height: 60,
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightGreen, width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(const Radius.circular(4.0)),
                          ),
                          child: Text(
                            "TRABAJOS DISPONIBLES",
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.lightGreen,
                  Colors.lightGreenAccent
                    ])
              ),
            ),
            ListTile(
              title: Text('Perfil y Datos'),
              onTap: () {
                Navigator.of(context).pushNamed('/perfil-page');
              },
              leading: Icon(
                  Icons.account_circle
              ),
            ),
            ListTile(
              title: Text('Historial'),
              onTap: () {
                Navigator.of(context).pushNamed('/historial-page');
              },
              leading: Icon(
                  Icons.reorder
              ),
            ),
            ListTile(
              title: Text('Cuenta Bancaria'),
              onTap: () {
                Navigator.of(context).pushNamed('/pago-page');
              },
              leading: Icon(
                  Icons.payment
              ),
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                Navigator.of(context).pushNamed('/configuracion-page');
              },
              leading: Icon(
                  Icons.settings
              ),
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                Navigator.of(context).pushNamed('/ayuda-page');
              },
              leading: Icon(
                  Icons.help
              ),
            )
          ],
        ),
      ),
    );
  }
}

