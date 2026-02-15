import 'package:flutter/material.dart';
import 'package:flutter_menu/src/feature/home/widget/home_screen.dart';

/// Type definition for the page.
@immutable
sealed class AppPage extends MaterialPage<void> {
  const AppPage({
    required String super.name,
    required Map<String, Object?>? super.arguments,
    required super.child,
    required LocalKey super.key,
  });

  @override
  String get name => super.name ?? 'Unknown';

  abstract final Set<String> tags;

  @override
  Map<String, Object?> get arguments => switch (super.arguments) {
    Map<String, Object?> args when args.isNotEmpty => args,
    _ => const <String, Object?>{},
  };

  @override
  int get hashCode => key.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppPage && key == other.key;
}

final class HomePage extends AppPage {
  const HomePage({super.key = const ValueKey('HomePage'), super.arguments = const {}})
    : super(name: 'HomePage', child: const HomeScreen());

  @override
  Set<String> get tags => {'HomePage'};
}
