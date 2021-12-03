import 'package:flutter_rosseti_hack/questions/models/Question.dart';

final questions = [
  Question(
    id: 1,
    questinText: 'Вопрос 1',
    theoryText:
        '''Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации.''',
    theoryTheme: 'Какая-то тема 1',
    isSelected: false,
    correctIndex: 0,
    answersVariants: [
      'Ответ 1',
      'Ответ 2',
      'Ответ 3',
      'Ответ 4',
    ],
  ),
  Question(
    id: 2,
    questinText: 'Вопрос 2',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 1,
    answersVariants: [
      'Ответ /1/',
      'Ответ 2',
      'Ответ 3',
      'Ответ 4',
    ],
  ),
  Question(
    id: 3,
    questinText: 'Вопрос 3',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 2,
    answersVariants: [
      'Ответ _1_',
      'Ответ 2',
      'Ответ 3',
      'Ответ 4',
    ],
  ),
  Question(
    id: 4,
    questinText: 'Вопрос 4',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 3,
    answersVariants: [
      'Ответ __1__',
      'Ответ 2',
      'Ответ 3',
      'Ответ 4',
    ],
  ),
];

class QuestionService {
  int _rating = 0;

  int get getLen => questions.length;
  int get getRating => _rating;

  void clearSelected() {
    for (var value in questions) {
      if (value.isSelected) {
        value.isSelected = false;
      }
    }
  }

  bool checkCorrectAnswer(int index, int answerIndex, String textAnswer) {
    if (questions[index].correctIndex == answerIndex) {
      _rating++;

      return true;
    }

    return false;
  }
}
