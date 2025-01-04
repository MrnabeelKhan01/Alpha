import 'package:flutter/material.dart';

class Appointment {
  Appointment({
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.isAllDay,
  });

  String subject;
  DateTime startTime;
  DateTime endTime;
  Color color;
  bool isAllDay;
}