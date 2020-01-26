import 'package:flutter/material.dart';

class results {
  const results({
    @required this.title,
    @required this.description,
    this.types = const [],
    @required this.time,
    @required this.image,
    @required this.location,
    @required this.email,
    @required this.organization,
    @required this.website,
    @required this.requirements

  });

  final String location;
  final String image;
  final String email;
  final String organization;
  final String website;
  final String requirements;
  final String time;
  final String title;
  final String description;
  final List<String> types;
}
