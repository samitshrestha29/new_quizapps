import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/providers/category_provider.dart';
import 'package:quiz_app/views/home/category_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          final _categories = ref.watch(categoryProvider);
          return _categories.when(
              data: (_data) {
                return CategorySection(categories: _data);
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
