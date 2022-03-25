import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/models/category_model.dart';
import 'package:quiz_app/views/home/category_difficulty_section.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key, required this.categories}) : super(key: key);
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 1.5,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (conetxt) =>
                      CategoryDifficultySection(catId: categories[index].id)));
            },
            child: Card(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4.0),
                child: Text(
                  categories[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
