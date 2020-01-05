import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workers/first-page.dart';
import 'package:workers/home.dart';
import 'package:workers/introScreen.dart';
import 'package:workers/ui/views/addTrabajo.dart';
import 'package:workers/ui/views/trabajoDetails.dart';
import 'package:workers/ui/views/trabajos.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){
      case '/':
        return MaterialPageRoute(
          builder: (_) => IntroScreen()
        );
      case '/addTrabajo' :
        return MaterialPageRoute(
          builder: (_)=> AddTrabajo()
        );
      case '/trabajoDetails' :
        return MaterialPageRoute(
          builder: (_)=> trabajoDetails()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ));
    }
  }
}