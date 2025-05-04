import 'package:feature_based_mvvm_architecture/app/provider/checkout_provider.dart';
import 'package:feature_based_mvvm_architecture/app/provider/current_data.dart';
import 'package:feature_based_mvvm_architecture/app/provider/home_product_add_provider.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/view_model/home_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/view_model/account_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/forgot_password/view_model/forgot_pass_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view_model/login_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/signup/view_model/signup_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/view_model/checkout_view_model.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<CurrentData>(create: ((context) => CurrentData())),
  ChangeNotifierProvider<CheckoutProvider>(
    create: ((context) => CheckoutProvider()),
  ),
  ChangeNotifierProvider<CartViewModel>(create: ((context) => CartViewModel())),

  ChangeNotifierProvider<HomeProductAddProvider>(
    create: ((context) => HomeProductAddProvider()),
  ),
  ChangeNotifierProvider<LoginViewModel>(
    create: ((context) => LoginViewModel()),
  ),
  ChangeNotifierProvider<SignupViewModel>(
    create: ((context) => SignupViewModel()),
  ),
  ChangeNotifierProvider<AccountViewModel>(
    create: ((context) => AccountViewModel()),
  ),
  ChangeNotifierProvider<CheckoutViewModel>(
    create: ((context) => CheckoutViewModel()),
  ),

  ChangeNotifierProvider<ForgotPassViewModel>(
    create: ((context) => ForgotPassViewModel()),
  ),
  ChangeNotifierProvider<HomeViewModel>(create: ((context) => HomeViewModel())),
];
