import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
//import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

import 'routes/routes.dart';
import 'routes/paths.dart';

Future<void> main() async {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
      useCountryCode: false,
      fallbackFile: 'cn',
      path: 'assets/i18n',
      forcedLocale: new Locale('cz'));
  WidgetsFlutterBinding.ensureInitialized();
  await flutterI18nDelegate.load(null);

  return runApp(LxkApp(flutterI18nDelegate));
}

class LxkApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  LxkApp(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) {

    return OKToast(
      child: MaterialApp(
        title: "lxk app",
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        //home: LoginPage(title: 'Flutter Demo Home Page'),
        initialRoute: log_in,
        routes: routers,
        onGenerateRoute: _getRoute,
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
      )
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
