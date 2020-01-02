import 'package:flutter/material.dart';

class NotificacionesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return NotificacionesView();
  }
}

class NotificacionesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotificacionesState();
  }
}

const kExpandedHeight = 300.0;

class NotificacionesState extends State<NotificacionesView> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: kExpandedHeight,
                floating: false,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.lightGreen,
                leading: GestureDetector(
                  child: IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(Icons.close, size: 28, color: Colors.white),
                  ),
                ),
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Ayuda",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(Icons.help),
                        onPressed: () => Navigator.pushNamed(context, '/ayuda-page'),
                        color: Colors.white,
                      )
                    ],
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: <Widget>[
                      Container(
                        height: 300,
                        decoration: BoxDecoration(color: Colors.lightGreen),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FunctionalButton(
                                  icon: Icons.attach_money,
                                  title: "Balance",
                                  onPressed: () =>
                                      Navigator.pushNamed(context, "/historial-page"),
                                ),
                                ProfileButton(
                                  icon: Icons.star,
                                  title: "",
                                  rating: "4.88",
                                ),
                                FunctionalButton(
                                  icon: Icons.perm_identity,
                                  title: "Perfil",
                                  onPressed: () =>
                                      Navigator.pushNamed(context, "/perfil-page"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Notificaciones",
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Explora los trabajos cerca de tu Área",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("31/12/19, 3:54 PM",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.warning,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("", //Comentario
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("", //Fecha
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title:
                    Text("", style: TextStyle(fontSize: 20)),
                    subtitle: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("",
                            style: TextStyle(fontSize: 16))),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class FunctionalButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.black,
          fillColor: Colors.black,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                widget.icon,
                size: 50.0,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class ProfileButton extends StatefulWidget {
  final String title, rating;
  final IconData icon;
  final Function() onPressed;

  const ProfileButton(
      {Key key, this.title, this.rating, this.icon, this.onPressed})
      : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Positioned(
            left: 14,
            top: 75,
            child: Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.rating,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    widget.icon,
                    color: Colors.black,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}