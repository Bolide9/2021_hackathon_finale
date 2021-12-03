class Question {
  int id;
  String questinText;
  String theoryTheme;
  String theoryText;
  List<String> answersVariants;
  int correctIndex;
  bool isSelected;

  Question({
    required this.id,
    required this.questinText,
    required this.theoryTheme,
    required this.theoryText,
    required this.answersVariants,
    required this.correctIndex,
    required this.isSelected,
  });
}
