import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/font.dart';

class MainCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MainCards({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(31, 34, 40, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: interFont(),
          ),
          Text(
            subtitle,
            style: interFont(),
          ),
        ],
      ),
    );
  }
}
