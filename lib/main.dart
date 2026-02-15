import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';
import 'package:flutter_menu/src/feature/initialization/data/initialization_process.dart';
import 'package:flutter_menu/src/feature/initialization/data/initialization_steps.dart';
import 'package:flutter_menu/src/feature/initialization/widget/app.dart';
import 'package:flutter_menu/src/feature/initialization/widget/app_error.dart';
import 'package:l/l.dart';

void main() {
  DependencyInitializer<InitializationProcess, Dependency>(
    createProcess: InitializationProcess.new,
    steps: initializationSteps,
    onStart: (completer) {
      l.i('Initialization started');
    },
    onStartStep: (step) {
      l.i('Initialization step: ${step.title} started');
    },
    onSuccessStep: (step, stepDuration, duration) {
      l.i('Initialization step: ${step.title} finished in $stepDuration | $duration');
    },
    onSuccess: (result, duration) => runApp(App(dependency: result.container)),
    onError: (error, stackTrace, process, step, duration) => runApp(AppError(error: error, stackTrace: stackTrace)),
  ).run();
}
