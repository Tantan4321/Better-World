import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:minnehack_app/models/planets.dart';
import 'package:minnehack_app/widgets/event_summary.dart';
import 'package:url_launcher/url_launcher.dart';
import '../configs/AppColors.dart';


class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => new _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10.0,
        gradient: LinearGradient(colors: [Colors.teal, Colors.blue]),
        title: Text('Better World'),
      ),
      backgroundColor: AppColors.navyBlue,
      body: Expanded(
        child: Container(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                        (context, index) => new EventSummary(planets[index]),
                    childCount: planets.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}