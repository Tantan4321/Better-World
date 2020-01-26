import 'package:flutter/material.dart';
import 'package:minnehack_app/configs/AppColors.dart';
import 'package:minnehack_app/configs/text_styles.dart';
import 'package:minnehack_app/models/event.dart';
import 'package:minnehack_app/widgets/event_v2_card.dart';
import 'package:minnehack_app/widgets/separator.dart';
import 'package:nice_button/nice_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Event event;
  final int id;

  DetailPage(this.event, this.id);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          color: new Color(0xFF008080),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _getHeader(context),
                  _getContent(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _getEmailButton(context),
                  ),
                ],
              ),
              Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
                child: EventV2Card(event: event, id: id,),
              ),
            ],
          )),
    );
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Could not Launch Command");
    }
  }

  String _messageBuilder(){
    String str = 'mailto:';
    String email = 'betterworld@betterworld.com';
    String personName = 'Eastan%20Giebler';

    str += email;
    str += "?subject=Volunteer%20Signup%20for%20Better%20World";
    str += '&body=' + personName + '%20signed%20up%20for%20the%20"' + event.title + '"%20event.';
    return str;
  }

  NiceButton _getEmailButton(context) {
    return NiceButton(
      text: "Sign up",
      radius: 40,
      background: AppColors.navyBlue,
      onPressed: () {
        customLaunch(
            _messageBuilder());
      },
    );
  }

  Stack _getHeader(context) {
    return Stack(
      children: <Widget>[
        _getBackground(),
        _getGradient(),
        _getToolbar(context),
      ],
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        event.image,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[Colors.transparent, new Color(0xFF008080)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    return new Container(
      child: Expanded(
        child: new ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 32.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Overview".toUpperCase(),
                    style: Style.headerTextStyle,
                  ),
                  Separator(),
                  Text(event.description, style: Style.detailsTextStyle),
                  SizedBox(height: 20.0,),
                  Text(
                    "Date + Time".toUpperCase(),
                    style: Style.headerTextStyle,
                  ),
                  Separator(),
                  Text(event.time, style: Style.detailsTextStyle),
                  SizedBox(height: 20.0,),
                  Text(
                    "Requirements".toUpperCase(),
                    style: Style.headerTextStyle,
                  ),
                  Separator(),
                  Text(event.requirements, style: Style.detailsTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery
          .of(context)
          .padding
          .top),
      child: new BackButton(color: AppColors.darkBlue),
    );
  }
}
