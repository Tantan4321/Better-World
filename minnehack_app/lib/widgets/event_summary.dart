import 'package:flutter/material.dart';
import 'package:minnehack_app/configs/text_styles.dart';
import 'package:minnehack_app/models/planets.dart';
import 'package:minnehack_app/widgets/separator.dart';


class EventSummary extends StatelessWidget {

  final Planet event;
  final bool horizontal;

  EventSummary(this.event, {this.horizontal = true});

  EventSummary.vertical(this.event): horizontal = false;


  @override
  Widget build(BuildContext context) {

    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
          tag: "planet-hero-${event.id}",
          child: new Image(
          image: new AssetImage(event.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );



    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(event.gravity, style: Style.smallTextStyle),
          ]
        ),
      );
    }


    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 12.0 : 42.0, 16.0, 12.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(event.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(event.location, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: event.distance,
                  image: 'assets/img/ic_distance.png')

              ),
              new Container(
                width: horizontal ? 8.0 : 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                  value: event.gravity,
                  image: 'assets/img/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );


    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
        ? new EdgeInsets.only(left: 46.0)
        : new EdgeInsets.only(top: 72.0),
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
//      onTap: horizontal
//          ? () => Navigator.of(context).push(
//             PageRouteBuilder(
//              pageBuilder: (_, __, ___) =>  DetailPage(planet),
//              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//                 FadeTransition(opacity: animation, child: child),
//              ) ,
//            )
//          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      )
    );
  }
}
