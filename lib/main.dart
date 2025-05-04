import 'dart:io';

import 'package:feature_based_mvvm_architecture/features/auth/model/local/login_local_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'app/constants/custome_theme.dart';
import 'app/localization/app_localization.dart';
import 'app/provider/current_data.dart';
import 'app/provider/register/register_provider.dart';
import 'app/router/app_router.dart';
import 'database/model/cart/cart_items.dart';
import 'database/model/wishlist/wishlist_local_model.dart';

import 'shared/networks/dio/dio.dart';
import 'utils/di.dart';
import 'utils/helper_methods.dart';

// Firebase background handler
Future<void> backgroundHandler(RemoteMessage message) async {
  // Handle background notifications here (if necessary)
  if (kDebugMode) {
    print("Handling background message: ${message.messageId}");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(MyApp());
}

Future<void> initializeApp() async {
  await initializeHive();
  await GetStorage.init();
  await diSetup();
  AppRouter.setupRouter();

  initiInternetChecker();

  DioSingleton.instance.create();
}

Future<void> initializeHive() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(CartItemsAdapter());
  Hive.registerAdapter(WishlistLocalModelAdapter());
  Hive.registerAdapter(LoginLocalModelAdapter());
  await Hive.openBox('hive_app');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();

    return MultiProvider(
      providers: providers,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, t) async {
          showMaterialDialog(context);
        },
        child: const UtillScreenMobile(),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (_, __) async {
            showMaterialDialog(context);
          },
          child: Consumer<CurrentData>(
            builder: (context, provider, child) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: CustomTheme.kToDark,
                  useMaterial3: false,
                ),
                locale: provider.locale,
                localizationsDelegates: const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en'), Locale('bn')],
              );
            },
          ),
        );
      },
    );
  }
}
