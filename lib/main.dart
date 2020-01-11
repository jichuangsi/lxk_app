import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'routes/paths.dart';

void main() => runApp(LxkApp());

class LxkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(title: 'Flutter Demo Home Page'),
      initialRoute: log_in,
      routes: routers,
      onGenerateRoute: _getRoute,
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  /*if (settings.name == '') {
    final String symbol = settings.arguments as String;

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) =>
          //dosomthing
    );
  }*/
  // The other paths we support are in the routes table.
  return null;
}
