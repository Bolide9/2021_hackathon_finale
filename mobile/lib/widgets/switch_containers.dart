import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/font.dart';

class SwitchContainers extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color textColor;
  final Color borderColor;

  const SwitchContainers({
    Key? key,
    required this.text,
    this.isSelected = false,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Text(
        '$text',
        style: interFont(color: textColor),
      ),
    );
  }
}
