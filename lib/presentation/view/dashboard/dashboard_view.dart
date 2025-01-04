import 'package:alpha/presentation/elements/appbar_widget.dart';
import 'package:alpha/presentation/view/dashboard/layout/body.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:DashBoardBody(),
    );
  }
}
