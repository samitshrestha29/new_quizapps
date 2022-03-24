import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/models/category_model.dart';
import 'package:quiz_app/data/repository.dart';

final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  return ref.watch(repositoryProvider).getAllCategories();
});
