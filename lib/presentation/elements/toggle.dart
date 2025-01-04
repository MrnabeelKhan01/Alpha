import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      fixedWidth:95,
      height:45,
      padding:5,
      initialValue: 1,
      children: {
        1: Text('Month'),
        2: Text('Week'),
        3: Text('Day'),
      },
      decoration: BoxDecoration(
        color: Color(0xffE8EAED),
        borderRadius: BorderRadius.circular(14),
      ),
      thumbDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: Offset(
              0.0,
              3.0,
            ),
          ),
        ],
      ),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}
