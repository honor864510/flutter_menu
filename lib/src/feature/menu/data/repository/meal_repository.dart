import 'package:flutter_menu/src/feature/menu/data/model/meal_entity.dart';

abstract interface class MealRepository {
  Future<List<MealEntity>> fetchMeals({int? limit, int? offset});
}
