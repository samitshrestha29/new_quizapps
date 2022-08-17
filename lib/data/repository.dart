import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/commons/config.dart';
import 'package:quiz_app/data/core/api_client.dart';
import 'package:quiz_app/data/models/category_difficulty_model.dart';
import 'package:quiz_app/data/models/category_model.dart';
import 'package:quiz_app/data/models/quiz_model.dart';

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

  Future<List<QuizModel>> getQuiz(
      {required int catId, String difficulty = 'easy'}) async {
    try {
      final data = await ApiClient().getData(
          endpoint:
              'api.php?amount=10&category=$catId&difficulty=$difficulty&type=multiple');
      final List result = data['results'];
      final List<QuizModel> quizes =
          result.map((e) => QuizModel.fromJson(e)).toList();
      return quizes;
    } on SocketException catch (error) {
      throw Exception('Internet not connected : $error');
    } catch (e) {
      throw Exception('Api Error : $e');
    }
  }
}
