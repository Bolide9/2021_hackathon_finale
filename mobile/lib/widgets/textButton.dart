import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  TextButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        text: text,
      ),
    );
  }
}
