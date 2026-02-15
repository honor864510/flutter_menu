import 'package:flutter/material.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';
import 'package:flutter_menu/src/common/navigation/app_navigator.dart';

/// {@template app}
/// App widget.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    required this.dependency,

    // ignore: unused_element_parameter
    super.key,
  });

  final Dependency dependency;

  @override
  Widget build(BuildContext context) => MaterialApp(home: AppNavigator(pages: const [HomePage()]));
}
