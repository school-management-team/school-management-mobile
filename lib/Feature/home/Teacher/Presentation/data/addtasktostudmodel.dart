class newtaskmodel {
  final String subject;
  final String classsection;
  final String title;
  final String description;
  final String grade;
  final String date;
  final List<String> files;
  newtaskmodel({
    required this.title,
    required this.subject,
    required this.grade,
    required this.description,
    required this.date,
    required this.classsection,
    this.files = const [],
  });
}
