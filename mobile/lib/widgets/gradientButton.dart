import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/font.dart';

class GradientButton extends StatelessWidget {
  GradientButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, left: 30, right: 30),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 95, 163, 1),
              Color.fromRGBO(0, 149, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(41, 166, 255, 1),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 139, 238, 0.4),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
          onPressed: onPressed,
          child: Center(
            child: Text(
              '$text',
              style: interFont(),
            ),
          ),
        ),
      ),
    );
  }
}
