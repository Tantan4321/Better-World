import 'package:flutter/material.dart';
import 'package:minnehack_app/configs/AppColors.dart';
import 'package:minnehack_app/configs/text_styles.dart';
import 'package:minnehack_app/models/event.dart';
import 'package:minnehack_app/widgets/event_v2_card.dart';
import 'package:minnehack_app/widgets/separator.dart';

class DetailPage extends StatelessWidget {
  final Event event;

  DetailPage(this.event);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          color: new Color(0xFF736AB7),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[_getHeader(context), _getContent()],
              ),
              Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
                child: EventV2Card(event: event),
              ),
            ],
          )),
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
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
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
                  new Text(
                    _overviewTitle,
                    style: Style.headerTextStyle,
                  ),
                  Separator(),
                  Text(event.description, style: Style.commonTextStyle),
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
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.red),
    );
  }
}
