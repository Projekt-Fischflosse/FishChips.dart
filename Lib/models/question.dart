class Question {
  final String frage;
  final List<String> antworten;
  final int richtig;
  final String explanation;

  const Question({
    required this.frage,
    required this.antworten,
    required this.richtig,
    this.explanation = '',
  });
}
