import 'package:flutter/widgets.dart';
import 'package:flutter_menu/src/feature/menu/data/repository/menu_repository.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:shared_preferences/shared_preferences.dart';

extension BuildContextDependency on BuildContext {
  Dependency get dependency => Dependency.of(this);
}

final class Dependency {
  Dependency();

  /// The state from the closest instance of this class.
  ///
  /// {@macro dependencies}
  factory Dependency.of(BuildContext context) => InheritedDependencies.of(context);

  /// Shared preferences
  late final SharedPreferences sharedPreferences;

  /// Repository
  late final IMenuRepository menuRepository;

  /// Pocketbase
  late final PocketBase pocketBase;
}

/// Fake Dependencies
@visibleForTesting
final class FakeDependency extends Dependency {
  FakeDependency();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    // ... implement fake dependencies
    throw UnimplementedError();
  }
}

/// {@template inherited_dependencies}
/// InheritedDependencies widget.
/// {@endtemplate}
class InheritedDependencies extends InheritedWidget {
  /// {@macro inherited_dependencies}
  const InheritedDependencies({required this.dependencies, required super.child, super.key});

  final Dependency dependencies;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  static Dependency? maybeOf(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType<InheritedDependencies>()?.widget as InheritedDependencies?)
          ?.dependencies;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
    'Out of scope, not found inherited widget '
        'a InheritedDependencies of the exact type',
    'out_of_scope',
  );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  static Dependency of(BuildContext context) => maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedDependencies oldWidget) => false;
}
