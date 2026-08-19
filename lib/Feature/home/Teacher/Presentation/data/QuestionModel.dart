class QuestionModel {
  final String id;
  final String questionText;
  final String subject;
  final String difficulty;
  final List<String>? options;
  final String? explanation;
  final DateTime creataAt;
  final String typequestion;
  int usage;
  bool isBookMarked;
  QuestionModel({
    required this.id,
    required this.creataAt,
    required this.difficulty,
    this.explanation,
    this.options,
    required this.questionText,
    required this.subject,
    required this.typequestion,
    this.isBookMarked = false,
    this.usage = 0,
  });
}
