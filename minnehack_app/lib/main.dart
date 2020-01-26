import 'package:flutter/material.dart';
import 'package:minnehack_app/ui/details_page.dart';
import 'package:minnehack_app/ui/user_page.dart';
import 'package:minnehack_app/ui/events_page.dart';
import 'package:minnehack_app/ui/home.dart';
import 'ui/login_page.dart';
import 'widgets/fade_page_route.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'MinneHack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, //TODO: change
        fontFamily: 'Nunito',
      ),

      initialRoute: '/',
      onGenerateRoute: _getRoute,


    );

  }

  Route _getRoute(RouteSettings settings) {
    //final ScreenArguments args = settings.arguments;
    switch (settings.name) {
      case '/':
        return FadeRoute(page: LoginPage());

      case '/home':
        return FadeRoute(page: Home());

      case '/list':
        return FadeRoute(page: EventsList());

      case '/user':
        return FadeRoute(page: UserProfile());

      default:
        return null;
    }
  }
}