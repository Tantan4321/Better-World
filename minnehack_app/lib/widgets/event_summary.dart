import 'package:flutter/material.dart';
import 'package:minnehack_app/configs/text_styles.dart';
import 'package:minnehack_app/models/event.dart';
import 'package:minnehack_app/ui/details_page.dart';
import 'package:minnehack_app/widgets/separator.dart';

class EventSummary extends StatelessWidget {
  final Event event;
  final int id;

  EventSummary({this.event, this.id});

  @override
  Widget build(BuildContext context) {
    final eventThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 28.0),
      alignment: FractionalOffset.centerLeft,
      child: Hero(
        tag: "event-hero-$id",
        child: Image(
          image: NetworkImage(event.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _eventValue({String value, IconData icon}) {
      return Container(
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(
            icon,
            size: 12.0,
            color: Colors.blue,
          ),
          Container(width: 8.0),
          Expanded(
            child: Text(value,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.clip,
                style: Style.smallTextStyle),
          ),
        ]),
      );
    }

    final cardContent = Container(
      margin: new EdgeInsets.fromLTRB(76.0, 12.0, 16.0, 12.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(event.title, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(event.organization, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: 1,
                  child: _eventValue(value: event.website, icon: Icons.web)),
              new Container(
                width: 8.0,
              ),
              new Expanded(
                  flex: 1,
                  child: _eventValue(value: event.email, icon: Icons.email))
            ],
          ),
        ],
      ),
    );

    final eventCard = new Container(
      child: cardContent,
      height: 150.0,
      margin: EdgeInsets.only(left: 46.0),
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
        onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailPage(event),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
            ),
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              eventCard,
              eventThumbnail,
            ],
          ),
        ));
  }
}
