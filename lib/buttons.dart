// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final buttonText;
  final buttontapped;
  final bool hasTopLeftBorderRadius; // Add this line
  final bool hasTopRightBorderRadius; // Add this line

  const Buttons(
      {super.key,
      this.color,
      this.textColor,
      this.buttonText,
      this.buttontapped,
      this.hasTopLeftBorderRadius = false,
      this.hasTopRightBorderRadius = false}); // Modify this line

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: hasTopLeftBorderRadius
                ? const Radius.circular(25)
                : Radius.zero,
            topRight: hasTopRightBorderRadius
                ? const Radius.circular(25)
                : Radius.zero,
          ),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
