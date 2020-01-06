import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:workers/core/viewmodels/CRUDTrabajador.dart';
import 'package:workers/ui/views/a%C3%B1adirdatos.dart';
import 'package:workers/ayuda.dart';
import 'package:workers/configuracion.dart';
import 'package:workers/core/services/api.dart';
import 'package:workers/core/viewmodels/CRUDModel.dart';
import 'package:workers/core/viewmodels/CRUDPerfil.dart';
import 'package:workers/historial.dart';
import 'package:workers/home.dart';
import 'package:workers/locator.dart';
import 'package:workers/notificaciones.dart';
import 'package:workers/pago.dart';
import 'package:workers/perfil.dart';
import 'package:workers/ui/views/trabajos.dart';
import 'package:flutter/services.dart';
import 'package:workers/ui/router.dart';
import 'first-page.dart';
import 'login.dart';
import 'registro.dart';

void main(){
    setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final routes = {
    '/login-page': (BuildContext context) => new LoginMenu(),
    '/home-page': (BuildContext context) => new HomePage(),
    '/historial-page': (BuildContext context) => new HistorialPage(),
    '/notificaciones-page': (BuildContext context) => new NotificacionesPage(),
    '/ayuda-page': (BuildContext context) => new Ayuda(),
    '/perfil-page': (BuildContext context) => new ProfileView(),
    '/pago-page': (BuildContext context) => new TarjetaPage(),
    '/datos-page': (BuildContext context) => new AddDataPage(),
    '/configuracion-page': (BuildContext context) => new ConfiguracionPage(),
    '/trabajos-page': (BuildContext context) => new TrabajoPage(),
    '/first-page': (BuildContext context) => new FirstPage()
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CRUDModel>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDPerfil>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDTrabajador>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          title: 'WorkerS',
          theme: ThemeData(),
          onGenerateRoute: Router.generateRoute,
          routes: routes,
    ),
    );
  }
}
