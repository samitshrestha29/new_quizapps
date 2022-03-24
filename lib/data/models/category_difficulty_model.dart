class CategoryDifficultyModel {
  final int totalCount;
  final int totalEasyQuestions;
  final int totalMediumQuestions;
  final int totalHardQuestions;

  CategoryDifficultyModel({
    required this.totalCount,
    required this.totalEasyQuestions,
    required this.totalHardQuestions,
    required this.totalMediumQuestions,
  });

  factory CategoryDifficultyModel.fromJson(Map<String, dynamic> json) {
    return CategoryDifficultyModel(
        totalCount: json['total_question_count'],
        totalEasyQuestions: json['total_easy_question_count'],
        totalHardQuestions: json['total_hard_question_count'],
        totalMediumQuestions: json['total_medium_question_count']);
  }
}
