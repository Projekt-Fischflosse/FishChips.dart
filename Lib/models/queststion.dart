class Question {
  final String frage;
  final List<String> antworten;
  final int richtig;

  const Question({
    required this.frage,
    required this.antworten,
    required this.richtig,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      frage: (json['frage'] ?? '').toString(),
      antworten: (json['antworten'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
      richtig: (json['richtig'] is int)
          ? json['richtig'] as int
          : int.tryParse(json['richtig']?.toString() ?? '0') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'frage': frage,
        'antworten': antworten,
        'richtig': richtig,
      };
}
