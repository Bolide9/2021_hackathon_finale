import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/font.dart';
import 'package:flutter_rosseti_hack/main.dart';
import 'package:flutter_rosseti_hack/questions/service/QuestionService.dart';
import 'package:flutter_rosseti_hack/widgets/gradientButton.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.result}) : super(key: key);

  final int result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late QuestionService _questionService;
  late int questionsLen;

  @override
  void initState() {
    super.initState();
    _questionService = QuestionService();
    questionsLen = _questionService.getLen;
  }

  Future<void> _goBack() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
      (route) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Вы завершили теоретическую часть теста. Отлично!',
                style: interFont(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Ваш результат: ${widget.result} из $questionsLen',
                style: interFont(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 70),
            GradientButton(
              onPressed: () => _goBack(),
              text: 'Перейти к следующему модулю',
            ),
          ],
        ),
      ),
    );
  }
}
