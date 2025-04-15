class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> options = List<String>.from(json['incorrect_answers']);
    options.add(json['correct_answer']);
    options.shuffle();
    return Question(
      question: htmlDecode(json['question']),
      options: options.map(htmlDecode).toList(),
      correctAnswer: htmlDecode(json['correct_answer']),
    );
  }
}

String htmlDecode(String input) {
  return input
      .replaceAll('&quot;', '"')
      .replaceAll('&#039;', "'")
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>');
}
