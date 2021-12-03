import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/font.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.answerText,
    required this.isSelected,
  }) : super(key: key);

  final String answerText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 100,
          height: 49,
          decoration: BoxDecoration(
            color: Color.fromRGBO(23, 27, 33, 1),
            border: isSelected ? Border.all(
              color: Colors.green.shade500,
              width: 0.2,
            ) : null,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child: Text(
              '$answerText',
              style: interFont(),
            ),
          ),
        ),
      ],
    );
  }
}
