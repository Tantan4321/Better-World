import 'package:flutter/material.dart';
import 'package:minnehack_app/configs/text_styles.dart';
import 'package:minnehack_app/models/event.dart';
import 'package:minnehack_app/widgets/separator.dart';

class EventV2Card extends StatelessWidget {

  final Event event;

  EventV2Card({this.event});

  @override
  Widget build(BuildContext context) {
    final cardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 12.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(event.title, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(event.organization, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 32.0,
              )
            ],
          ),
        ],
      ),
    );


    final eventCard = new Container(
      child: cardContent,
      height: 154.0,
      margin: EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: eventCard,
        )
    );
  }
}
