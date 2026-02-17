import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';
import 'package:flutter_menu/src/feature/menu/data/repository/menu_repository.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class InitializationProcess extends DependencyInitializationProcess<Dependency> {
  InitializationProcess({this.sharedPreferences, this.menuRepository});

  /// Shared preferences
  SharedPreferences? sharedPreferences;

  /// Repository
  IMenuRepository? menuRepository;

  /// Pocketbase
  PocketBase? pocketBase;

  /// Converts isolated results into a container of type [T].
  ///
  /// [isolatedResults] - A map containing the results of isolated initialization steps.
  /// Returns a container of type [T] that contains all initialized dependencies.
  @override
  Dependency toContainer(Map<dynamic, dynamic> isolatedResults) => Dependency()
    ..sharedPreferences = sharedPreferences!
    ..pocketBase = pocketBase!
    ..menuRepository = menuRepository!;
}
