import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/providers/category_difficulty_provider.dart';

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
                return Column();
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
