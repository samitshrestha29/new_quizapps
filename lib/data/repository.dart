import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/commons/config.dart';
import 'package:quiz_app/data/core/api_client.dart';
import 'package:quiz_app/data/models/category_difficulty_model.dart';
import 'package:quiz_app/data/models/category_model.dart';

final repositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

class Repository {
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final data = await ApiClient().getData(endpoint: Config.getAllCategories);
      final List result = data['trivia_categories'];
      final List<CategoryModel> categories =
          result.map((e) => CategoryModel.fromJson(e)).toList();
      return categories;
    } on SocketException catch (error) {
      throw Exception('Internet not connected : $error');
    } catch (e) {
      throw Exception('Api Error : $e');
    }
  }

  Future<CategoryDifficultyModel> getCategoryDifficulty(
      {required int categoryId}) async {
    try {
      final data = await ApiClient()
          .getData(endpoint: '${Config.categorydifficultyLevel}$categoryId');
      final CategoryDifficultyModel difficultyModel =
          CategoryDifficultyModel.fromJson(data['category_question_count']);
      return difficultyModel;
    } on SocketException catch (error) {
      throw Exception('Internet not connected : $error');
    } catch (e) {
      throw Exception('Api Error : $e');
    }
  }
}
