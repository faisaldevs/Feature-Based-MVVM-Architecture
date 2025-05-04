import 'package:feature_based_mvvm_architecture/features/account/presentation/account_details_screen.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/change_password_screen.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/notification_setting.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/update_account_info_screen.dart';
import 'package:feature_based_mvvm_architecture/loading_screen.dart';
import 'package:go_router/go_router.dart';

class AccountRoute {
  static List<GoRoute> get routes {
    return [
      GoRoute(
        name: 'accountDetails',
        path: '/accountDetails',
        builder: (context, state) => AccountDetailsScreen(),
      ),
      GoRoute(
        name: 'updateAccountInfo',
        path: '/updateAccountInfo',
        builder: (context, state) => UpdateAccountInfoScreen(),
      ),
      GoRoute(
        name: 'changePassword',
        path: '/changePassword',
        builder: (context, state) => ChangePasswordScreen(),
      ),
      GoRoute(
        name: 'notificationSetting',
        path: '/notificationSetting',
        builder: (context, state) => NotificationSetting(),
      ),
      GoRoute(
        name: 'welcome',
        path: '/welcome',
        builder: (context, state) => Loading(),
      ),
    ];
  }
}
