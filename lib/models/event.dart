import 'package:flutter/material.dart';

class Event {
  final String title;
  final String subtitle;
  final List<String> times; // List of time slots, each 30 minutes apart
  final Color accentColor;
  final int attendeeCount;

  Event({
    required this.title,
    required this.subtitle,
    required this.times,
    required this.accentColor,
    required this.attendeeCount,
  });
}
