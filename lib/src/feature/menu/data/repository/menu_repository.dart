import 'package:flutter_menu/src/feature/menu/data/model/meal_category_entity.dart';
import 'package:flutter_menu/src/feature/menu/data/model/meal_entity.dart';

abstract interface class IMenuRepository {
  /// Fetch list of categories without paggination.
  /// Expected to have < 100 categories, so that's ok.
  /// If you need paggination you have an example below.
  Future<List<MealCategoryEntity>> fetchCategories();

  /// List of meals for specific category.
  /// Default [limit] and [offset] are set to 20.
  Future<List<MealEntity>> fetchMeals({required MealCategoryID categoryId, int limit = 20, int offset = 20});
}
