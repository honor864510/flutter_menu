import 'package:flutter/material.dart';
import 'package:flutter_menu/src/feature/menu/widget/meal_card.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
    itemCount: 10,
    padding: const EdgeInsets.all(12),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 320,
      mainAxisExtent: 300,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    itemBuilder: (context, index) => const MealCard(),
  );
}
