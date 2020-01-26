import 'package:flutter/material.dart';
import 'package:minnehack_app/ui/home.dart';
import 'ui/login_page.dart';
import 'widgets/fade_page_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MinneHack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, //TODO: change
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings) {
    //final ScreenArguments args = settings.arguments;
    switch (settings.name) {
      case "/login":
        return FadeRoute(page: LoginPage());

      case '/home':
        return FadeRoute(page: Home());

      case '/list':
        return FadeRoute(page: Home());

      default:
        return null;
    }
  }
}