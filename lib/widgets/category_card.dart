import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    this.onTap,
    required this.model,
  });
  final CategoryModel model;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: model.isSelected ? purple : dirtyWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            model.category,
            style: FontStyles.bodyOrange.copyWith(color: model.isSelected ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
