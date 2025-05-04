import 'package:feature_based_mvvm_architecture/features/cart/presentation/view/checkout_screen.dart';
import 'package:go_router/go_router.dart';

class CartRoute {
  static List<GoRoute> get routes {
    return [
      GoRoute(
        name: 'cart',
        path: '/cart',
        builder: (context, state) => CheckoutScreen(),
      ),
    ];
  }
}
