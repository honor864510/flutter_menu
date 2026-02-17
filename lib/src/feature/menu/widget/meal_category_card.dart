import 'package:flutter/material.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';
import 'package:flutter_menu/src/feature/menu/data/model/meal_category_entity.dart';
import 'package:pocketbase/pocketbase.dart';

class MealCategoryCard extends StatelessWidget {
  const MealCategoryCard({required this.category, super.key});
  final MealCategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final pocketBase = context.dependency.pocketBase;

    final imageUrl = category.imageUrl != null
        ? pocketBase.files
              .getURL(RecordModel({'collectionName': 'meal_category', 'id': category.id}), category.imageUrl!)
              .toString()
        : null;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // TODO: Handle images properly
          if (imageUrl != null)
            Image.network(imageUrl, width: .infinity, height: .infinity, fit: .cover)
          else
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: const Center(child: Icon(Icons.restaurant, size: 50, color: Colors.grey)),
            ),

          // Gradient overlay for better text readability
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: const Alignment(0, -0.5),
                  colors: [Theme.of(context).colorScheme.primary, Colors.transparent],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 4,
            right: 4,
            child: Text(
              category.name,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
