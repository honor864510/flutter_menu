import 'package:flutter/material.dart';
import 'package:flutter_menu/src/feature/menu/widget/menu_grid.dart';

/// {@template home_screen}
/// HomeScreen widget.
/// {@endtemplate}
class HomeScreen extends StatelessWidget {
  /// {@macro home_screen}
  const HomeScreen({
    super.key, // ignore: unused_element_parameter
  });

  @override
  Widget build(BuildContext context) => const Scaffold(body: MenuGrid());
}
