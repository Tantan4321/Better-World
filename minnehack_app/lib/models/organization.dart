import 'package:flutter/material.dart';

class Organization {
  const Organization({
    @required this.orgName,
    @required this.description,
    this.types = const [],
    @required this.image,
    @required this.color,
  });

  final Color color;
  final String image;
  final String orgName;
  final String description;
  final List<String> types;
}
