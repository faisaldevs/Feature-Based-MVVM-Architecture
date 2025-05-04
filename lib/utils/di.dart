import 'package:feature_based_mvvm_architecture/app/router/config/navigation_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/logger.dart';

final locator = GetIt.instance;

// Shortcuts
final appData = locator<GetStorage>();
final hiveBox = locator<Box>();
AppLogger get logger => locator<AppLogger>();

Future<void> diSetup() async {
  // Register async dependencies first
  await Hive.initFlutter();

  locator
    ..registerLazySingleton(() => FirebaseMessaging.instance)
    ..registerSingleton<GetStorage>(GetStorage())
    ..registerSingleton<AppLogger>(AppLogger())
    ..registerSingleton<NavigationService>(NavigationService()) // for GoRouter
    ..registerSingleton<Box>(await Hive.openBox("hive_app"));

  AppLogger.i("✅ DI Setup Completed");
}
