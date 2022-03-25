import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/models/quiz_model.dart';
import 'package:quiz_app/data/repository.dart';

final quizProvider =
    FutureProvider.family<List<QuizModel>, int>((ref, catId) async {
  return ref.read(repositoryProvider).getQuiz(catId: catId);
});
