import 'package:eyr/apn/apn_model.dart';
import 'package:flutter/material.dart';

class Application {
  final IconData icon;
  final String label;
  final ApnRoute route;

  Application({
    required this.icon,
    required this.label,
    required this.route,
  });
}
