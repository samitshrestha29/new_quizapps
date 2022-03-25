import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/providers/category_difficulty_provider.dart';
import 'package:quiz_app/views/quiz/quiz_page.dart';

class CategoryDifficultySection extends StatelessWidget {
  const CategoryDifficultySection({Key? key, required this.catId})
      : super(key: key);
  final int catId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Difficulty')),
      body: Consumer(
        builder: ((context, ref, child) {
          final difficulty = ref.watch(categoryDifficultyProvider(catId));
          return difficulty.when(
              data: (_data) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Total Questions : ${_data.totalCount}'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (conetxt) => QuizPage(catgoryId: catId)));
                      },
                      title: Text(
                          'Total  Easy Questions : ${_data.totalEasyQuestions}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text(
                          'Total Medium Questions : ${_data.totalMediumQuestions}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text(
                          'Total Hard Questions : ${_data.totalHardQuestions}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    )
                  ],
                );
              },
              error: (err, s) {
                return Text(err.toString());
              },
              loading: () => const Center(child: CircularProgressIndicator()));
        }),
      ),
    );
  }
}
