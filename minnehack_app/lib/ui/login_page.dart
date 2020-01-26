import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../configs/AppColors.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'iamhelper@gmail.com',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/home");
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    void customLaunch(command) async
    {
      if(await canLaunch(command))
        {
          await launch(command);
        }
      else
        {
          print("Could not Launch Command");
        }
    }

    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10.0,
        gradient: LinearGradient(colors: [Colors.teal, Colors.blue]),
        title: Center( child: Text('Better World'),),

      ),
      backgroundColor: AppColors.mintGreen,

      body: Container(
        decoration: BoxDecoration(
          color: AppColors.smokeWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),

        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Text('Better World', style: TextStyle(fontFamily: "Roboto",)),
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            RaisedButton(onPressed: ()
              {
                customLaunch('mailto:tantan2012g@gmail.com?subject=test%20,body=test%20test');
              },),
            forgotLabel
          ],
        ),
      ),
    );
  }
}