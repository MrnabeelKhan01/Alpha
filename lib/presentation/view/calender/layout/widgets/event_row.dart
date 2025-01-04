import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class AttendeeRow extends StatelessWidget {
  final List<String> imagePaths;

  const AttendeeRow(
      {super.key, required this.imagePaths});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        imagePaths.length,
            (index) {
          String imagePath = imagePaths[index % imagePaths.length];
          bool isSvg = imagePath.endsWith('.svg');

          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.transparent,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: isSvg
                    ? SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.cover,
                )
                    : ClipOval(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
