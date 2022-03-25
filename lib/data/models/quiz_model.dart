class QuizModel {
  final String category;
  final String difficuly;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuizModel({
    required this.category,
    required this.correctAnswer,
    required this.difficuly,
    required this.incorrectAnswers,
    required this.question,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
      category: json['category'],
      correctAnswer: json['correct_answer'],
      difficuly: json['difficulty'],
      incorrectAnswers:
          List<String>.from(json['incorrect_answers']).map((e) => e).toList(),
      question: json['question']);
}
