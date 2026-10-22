class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String explanation; // Tambahan untuk penjelasan jawaban

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}