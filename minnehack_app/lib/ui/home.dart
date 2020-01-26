import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:minnehack_app/widgets/category_list.dart';

import '../configs/AppColors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Center(child: Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 130.0,
        child: Image.asset(
          'assets/images/logo.png',
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ),
    ),));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),

        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Login", "/"),
      getNavItem(Icons.home, "Home", "/home"),
      getNavItem(Icons.verified_user, "User", "/user"),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10.0,
        gradient: LinearGradient(colors: [Colors.teal, Colors.blue]),
        title: Text('Better World'),
      ),
      backgroundColor: AppColors.darkBlue,
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: cHeight * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                "What type of volunteering\nare you looking for?",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.white,
                  height: 0.9,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: cHeight * 0.05),
            SizedBox(
                height: cHeight * 0.6,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CategoryList())),
          ],
        )
      ),
      drawer: getNavDrawer(context),
    );
  }
}
