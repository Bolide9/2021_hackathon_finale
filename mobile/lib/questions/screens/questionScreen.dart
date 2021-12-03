import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/font.dart';
import 'package:flutter_rosseti_hack/questions/screens/resultScreen.dart';
import 'package:flutter_rosseti_hack/questions/service/QuestionService.dart';
import 'package:flutter_rosseti_hack/questions/widgets/QuestionCard.dart';
import 'package:flutter_rosseti_hack/widgets/appBar.dart';
import 'package:flutter_rosseti_hack/widgets/gradientButton.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuestionService _questionService;
  late int questionsLen;
  int currentIndex = 1;
  int? selectedIndex;
  int? questionId;

  @override
  void initState() {
    super.initState();
    _questionService = QuestionService();
    questionsLen = _questionService.getLen;
  }

  @override
  void dispose() {
    super.dispose();
    _questionService.clearSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MainAppBar(
          appBarText: 'Теория',
          showDialogButton: false,
          withText: true,
          withLogo: false,
          paddingText: 0.0,
          currentIndex: currentIndex,
          withQuestionCount: true,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                questions[currentIndex - 1].questinText,
                style: interFont(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: questions[currentIndex - 1].answersVariants.length,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  final answersVariant = questions[currentIndex - 1].answersVariants[index];

                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (selectedIndex != null) {}
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: QuestionCard(
                        isSelected: selectedIndex == index,
                        answerText: answersVariant,
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            GradientButton(
              text: currentIndex != questions.length ? 'Далее' : 'Завершить',
              onPressed: () async {
                if (selectedIndex != null) {
                  if (currentIndex != questions.length) {
                    _questionService.checkCorrectAnswer(currentIndex - 1, selectedIndex!, questions[currentIndex - 1].answersVariants[selectedIndex!]);
                    setState(() {
                      currentIndex++;
                      selectedIndex = null;
                    });
                  } else {
                    _questionService.checkCorrectAnswer(currentIndex - 1, selectedIndex!, questions[currentIndex - 1].answersVariants[selectedIndex!]);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ResultScreen(result: QuestionService.getRating)), (route) => false);
                    Future.delayed(
                      Duration(seconds: 5),
                      () {
                        selectedIndex = null;
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
