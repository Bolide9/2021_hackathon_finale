import 'package:flutter_rosseti_hack/questions/models/Question.dart';

final questions = [
  Question(
    id: 1,
    questinText: 'За что отвечает левый стик на джойстике?',
    theoryText:
        '''Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации.''',
    theoryTheme: 'Какая-то тема 1',
    isSelected: false,
    correctIndex: 0,
    answersVariants: [
      'Взлет и снижение дрона, вращение вокруг своей оси',
      'Увеличение и уменьшение скорости',
      'Вращение камерой вокруг своей оси',
    ],
  ),
  Question(
    id: 2,
    questinText: 'За что отвечает левый стик?',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 2,
    answersVariants: [
      'Увеличение и уменьшение скорости дрона',
      'Зумирование камеры',
      'Наклоны дрона на левый и правый бок, вперед и назад',
    ],
  ),
  Question(
    id: 3,
    questinText: 'Что требуется сделать при риске столкновения?',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 1,
    answersVariants: [
      'Попытаться облететь объект',
      'Оперативно снизить скорость',
      'Попытаться развернуть дрон',
    ],
  ),
  Question(
    id: 4,
    questinText: 'Какой ряд действий нужно предпринять для безопасного старта полета?',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 2,
    answersVariants: [
      'Убедиться, что дрон заряжен и нет никаких неисправностей',
      'Убедиться, что рядом нет людей и физических препятствий',
      'Оба варианта правильные',
    ],
  ),
  Question(
    id: 5,
    questinText: 'До какой высоты может подняться квадрокоптер без получения разрешения в Единой системе организации воздушного движения?',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 2,
    answersVariants: [
      '500 метров',
      '250 метров',
      '150 метров',
    ],
  ),
  Question(
    id: 5,
    questinText: 'Какая оптимальная скорость при интенсивном тумане?',
    theoryText: '',
    theoryTheme: '',
    isSelected: false,
    correctIndex: 0,
    answersVariants: [
      '3-5 км/ч',
      '7-9 км/ч',
      'Оба варианта неправильные',
    ],
  ),
];

class QuestionService {
  static int _rating = 0;

  static int get getRating => _rating;

  int get getLen => questions.length;

  void clearRating() => _rating = 0;

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
