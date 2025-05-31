import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CategoryView(
              category: category.categoryName,
            );
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0, left: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                category.imageAssetUrl,
              ),
            ),
          ),
          padding: const EdgeInsets.only(right: 10),
          height: 100,
          width: 200,
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
