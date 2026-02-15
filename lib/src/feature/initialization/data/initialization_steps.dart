import 'dart:io' as io;

import 'package:control/control.dart';
import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu/src/common/controller/controller_observer.dart';
import 'package:flutter_menu/src/common/model/dependency.dart';
import 'package:flutter_menu/src/feature/initialization/data/initialization_process.dart';
import 'package:l/l.dart';
import 'package:window_manager/window_manager.dart';

final List<InitializationStep<InitializationProcess, Dependency>> initializationSteps = [
  InitializationStep<InitializationProcess, Dependency>(
    title: 'Framework, logger, observer initialization',
    run: (process) async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        // if (kReleaseMode) exit(1);
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        l.e(error, stack);
        return true;
      };

      Controller.observer = const ControllerObserver();
    },
  ),
  InitializationStep<InitializationProcess, Dependency>(
    title: 'Platform specific',
    run: (process) async {
      if (io.Platform.isWindows) {
        await windowManager.ensureInitialized();
        const windowOptions = WindowOptions(minimumSize: Size(320, 480), size: Size(720, 600), center: true);

        await windowManager.waitUntilReadyToShow(windowOptions, () async {
          if (io.Platform.isMacOS) {
            await windowManager.setMovable(true);
          }
          await windowManager.setMaximizable(true);
          await windowManager.show();
          await windowManager.focus();
        });
      }
    },
  ),
];
