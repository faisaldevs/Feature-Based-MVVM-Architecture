import 'package:feature_based_mvvm_architecture/features/auth/presentation/forgot_password/view/create_new_password.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/forgot_password/view/forgot_pass_email_otp_screen.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/forgot_password/view/forgot_pass_email_screen.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view/login_screen.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/signup/view/signup_screen.dart';
import 'package:go_router/go_router.dart';

class AuthRouter {
  static List<GoRoute> get routes {
    return [
      GoRoute(
        path: '/login',
        name: "login",
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: "signup",
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/forgotPassEmail',
        name: "forgotPassEmail",
        builder: (context, state) => ForgotPassEmailScreen(),
      ),
      GoRoute(
        path: '/forgotPassEmailOtp',
        name: "forgotPassEmailOtp",
        builder: (context, state) => ForgotPassEmailOTPScreen(),
      ),
      GoRoute(
        path: '/createNewPass',
        name: "createNewPass",
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
    ];
  }
}
