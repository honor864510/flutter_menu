import 'package:flutter_menu/src/feature/menu/data/model/meal_category_entity.dart';
import 'package:flutter_menu/src/feature/menu/data/model/meal_entity.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IMenuRepository {
  /// Fetch list of categories without paggination.
  /// Expected to have < 100 categories, so that's ok.
  /// If you need paggination you have an example below.
  Future<List<MealCategoryEntity>> fetchCategories();

  /// List of meals for specific category.
  /// Default [limit] and [offset] are set to 20.
  Future<List<MealEntity>> fetchMeals({required MealCategoryID categoryId, int limit = 20, int offset = 20});
}

final class MenuRepository implements IMenuRepository {
  MenuRepository({required this.preferences, required this.pb});

  final SharedPreferences preferences;

  // TODO: Change to pure dio implementation with cache interceptor
  final PocketBase pb;

  @override
  Future<List<MealCategoryEntity>> fetchCategories() async {
    final categories = await pb.collection('meal_category').getFullList();

    return categories.map((e) => MealCategoryEntity.fromJson(e.toJson())).toList();
  }

  @override
  Future<List<MealEntity>> fetchMeals({required MealCategoryID categoryId, int limit = 20, int offset = 20}) async {
    // TODO: implement fetchMeals
    throw UnimplementedError();
  }
}
