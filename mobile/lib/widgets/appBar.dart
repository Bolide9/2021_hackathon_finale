import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/colors.dart';
import 'package:flutter_rosseti_hack/font.dart';
import 'package:flutter_rosseti_hack/questions/service/QuestionService.dart';

class MainAppBar extends StatelessWidget {
  MainAppBar({
    Key? key,
    this.onPopPressed,
    this.onChatPressed,
    required this.appBarText,
    required this.showDialogButton,
    required this.withText,
    required this.withLogo,
    required this.withQuestionCount,
    required this.paddingText,
    this.currentIndex,
  }) : super(key: key);

  final String appBarText;
  final VoidCallback? onPopPressed;
  final VoidCallback? onChatPressed;
  final bool showDialogButton;
  final bool withText;
  final bool withLogo;
  final bool withQuestionCount;
  final double paddingText;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        children: [
          if (withLogo)
            Container(
              padding: EdgeInsets.only(left: 12),
              child: Image.asset(
                'images/Logo.png',
                height: 40,
              ),
            ),
          if (withText)
            Container(
              padding: EdgeInsets.only(left: paddingText),
              child: Text(
                '$appBarText',
                style: interFont(),
              ),
            )
        ],
      ),
      actions: [
        if (onPopPressed != null)
          IconButton(
            onPressed: onPopPressed,
            splashRadius: 25,
            icon: Icon(
              Icons.close,
              color: whiteColor,
            ),
          ),
        if (showDialogButton)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () => onChatPressed,
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                'images/chat.png',
                color: whiteColor,
              ),
            ),
          ),
        withQuestionCount
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Text(
                    '${currentIndex}/${questions.length}',
                    style: interFont(
                      color: Color.fromRGBO(119, 126, 144, 1),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
