import 'package:control/control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu/src/common/constant/assets.gen.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';
import 'package:flutter_menu/src/feature/menu/data/controller/meal_category_controller.dart';
import 'package:flutter_menu/src/feature/menu/data/controller/meal_category_controller_state.dart';
import 'package:flutter_menu/src/feature/menu/widget/meal_category_card.dart';

/// {@template meal_categories_screen}
/// MealCategoriesScreen widget.
/// {@endtemplate}
class MealCategoriesScreen extends StatelessWidget {
  /// {@macro meal_categories_screen}
  const MealCategoriesScreen({
    super.key, // ignore: unused_element_parameter
  });

  @override
  Widget build(BuildContext context) =>
      // ignore: experimental_member_use
      ControllerScope(
        () => MealCategoryController(menuRepository: context.dependency.menuRepository),
        child: const _Screen(),
      );
}

class _Screen extends StatefulWidget {
  const _Screen();

  @override
  State<_Screen> createState() => _ScreenState();
}

class _ScreenState extends State<_Screen> {
  late final MealCategoryController controller;

  @override
  void initState() {
    // ignore: experimental_member_use
    controller = ControllerScope.of<MealCategoryController>(context);

    controller.fetchCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Категории'), centerTitle: true),
    // ignore: experimental_member_use
    body: StateConsumer<MealCategoryController, MealCategoryControllerState>(
      builder: (context, state, _) => state.maybeMap(
        processing: (element) => GridView.builder(
          itemCount: 24,
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 320,
            mainAxisExtent: 300,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) =>
              Assets.images.restaurant.image(fit: .cover, width: .infinity, height: .infinity),
        ),
        orElse: () {
          if (state.data.categories.isEmpty) {
            return const Center(child: Text('Please contact the administrator'));
          }

          return GridView.builder(
            itemCount: state.data.categories.length,
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 320,
              mainAxisExtent: 240,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => MealCategoryCard(category: state.data.categories[index]),
          );
        },
      ),
    ),
  );
}
