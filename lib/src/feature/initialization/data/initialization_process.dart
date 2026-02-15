import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';

final class InitializationProcess extends DependencyInitializationProcess<Dependency> {
  InitializationProcess();

  /// Converts isolated results into a container of type [T].
  ///
  /// [isolatedResults] - A map containing the results of isolated initialization steps.
  /// Returns a container of type [T] that contains all initialized dependencies.
  @override
  Dependency toContainer(Map<dynamic, dynamic> isolatedResults) => const Dependency();
}
