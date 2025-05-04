// import 'package:feature_based_mvvm_architecture/loading_screen.dart';
// import 'package:feature_based_mvvm_architecture/app/router/config/account_route.dart';
// import 'package:feature_based_mvvm_architecture/app/router/config/auth_route.dart';
// import 'package:feature_based_mvvm_architecture/app/router/config/cart_route.dart';
// import 'package:feature_based_mvvm_architecture/app/router/config/category_route.dart';
// import 'package:feature_based_mvvm_architecture/app/router/config/home_route.dart';
// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';

// class AppRouter {
//   static final GoRouter _router = GoRouter(
//     initialLocation: '/',
//     routes: [
//       // Initial Route !! Don't Change it!!
//       GoRoute(
//         path: '/',
//         builder: (context, state) => Loading(),
//       ),

//       ...AuthRouter.routes,
//       ...HomeRoute.routes,
//       ...ProductRoute.routes,
//       ...CartRoute.routes,
//       ...AccountRoute.routes,
//     ],
//   );

//   static GoRouter get router => _router;
// }

// goBack(BuildContext context) => context.pop();
// lib/app/router/app_router.dart
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:go_router/go_router.dart';

import '../../loading_screen.dart';
import 'config/navigation_service.dart';
import 'routes/account_route.dart';
import 'routes/auth_route.dart';
import 'routes/cart_route.dart';
import 'routes/home_route.dart';

class AppRouter {
  static late final GoRouter _router;

  static void setupRouter() {
    final navService = locator<NavigationService>();

    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => Loading()),
        ...AuthRouter.routes,
        ...HomeRoute.routes,
        ...CartRoute.routes,
        ...AccountRoute.routes,
      ],
    );

    navService.setRouter(_router);
  }

  static GoRouter get router => _router;
}

// goBack(BuildContext context) => context.pop();
