import 'package:flutter/material.dart';

/// {@template app_error}
/// AppError widget.
/// {@endtemplate}
class AppError extends StatelessWidget {
  /// {@macro app_error}
  const AppError({
    super.key, // ignore: unused_element_parameter
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(body: Center(child: Text('AppError: $error, StackTrace: $stackTrace'))),
  );
}
