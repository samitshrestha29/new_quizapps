import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/models/category_difficulty_model.dart';
import 'package:quiz_app/data/repository.dart';

final categoryDifficultyProvider =
    FutureProvider.family<CategoryDifficultyModel, int>(
        (ref, categoryId) async {
  return ref
      .watch(repositoryProvider)
      .getCategoryDifficulty(categoryId: categoryId);
});
