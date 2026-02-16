import 'package:flutter_menu/src/feature/menu/data/repository/menu_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class Dependency {
  const Dependency({required this.menuRepository, required this.sharedPreferences});

  /// Shared preferences
  final SharedPreferences sharedPreferences;

  /// Repository
  final IMenuRepository menuRepository;
}
