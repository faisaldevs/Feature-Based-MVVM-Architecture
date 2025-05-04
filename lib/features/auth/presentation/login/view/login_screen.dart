import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view_model/login_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/common_widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.c202020,
        leading: GestureDetector(
          onTap: () => nav.toNavigation(),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(fontSize: 30.sp, color: AppColors.c1F1F1F),
                ),
                UIHelper.verticalSpace(34.h),
                _buildPhoneField(),
                UIHelper.verticalSpace(22.h),
                _buildPasswordField(),
                UIHelper.verticalSpace(40.h),
                _buildSignInButton(),
                UIHelper.verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By signing up, you agree to our ',
                            style: TextFontStyle
                                .headline12w400cF1F1F1styleLexend
                                .copyWith(
                                  color: AppColors.c737373,
                                  fontSize: 10.sp,
                                ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextFontStyle
                                .headline12w400cF1F1F1styleLexend
                                .copyWith(
                                  color: AppColors.c2A3A8F,
                                  fontSize: 10.sp,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Color(0xFFE3E7ED))),
                    UIHelper.horizontalSpace(15.w),
                    Text(
                      'Or',
                      style: TextFontStyle.headline12w500c0C89BFstyleLexend
                          .copyWith(color: AppColors.cAFAFAF),
                    ),
                    UIHelper.horizontalSpace(15.w),
                    Expanded(child: Divider(color: Color(0xFFE3E7ED))),
                  ],
                ),
                UIHelper.verticalSpace(30.h),
                AuthIconButton(
                  image: Assets.icons.google.path,
                  label: "Sign in with Google",
                ),
                UIHelper.verticalSpaceSmall,
                AuthIconButton(
                  image: Assets.icons.apple.path,
                  label: "Sign in with Apple",
                ),
                UIHelper.verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => nav.toSignup(),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextFontStyle
                                  .headline12w400cF1F1F1styleLexend
                                  .copyWith(
                                    color: AppColors.c737373,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextFontStyle
                                  .headline12w400cF1F1F1styleLexend
                                  .copyWith(
                                    color: AppColors.c2A3A8F,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email or phone number',
          style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
            color: AppColors.c202020,
          ),
        ),
        UIHelper.verticalSpace(8.h),
        CustomFormField(
          borderRadius: 3.sp,
          fillColor: AppColors.cF7F8FB,
          textInputAction: TextInputAction.next,
          controller: _phoneController,
          validator: _validatePhone,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Consumer<LoginViewModel>(
      builder: (context, vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                color: AppColors.c202020,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomFormField(
              isPass: true,
              borderRadius: 3.sp,
              isObsecure: vm.isObscure,
              suffixIcon: GestureDetector(
                onTap: () => vm.toggleObscure(),
                child: Icon(
                  vm.isObscure ? Icons.visibility : Icons.visibility_off,
                  size: 21.sp,
                ),
              ),
              fillColor: AppColors.cF7F8FB,
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              validator: _validatePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => vm.toggleRememberMe(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        activeColor: AppColors.c2A3A8F,
                        value: vm.isRememberMe,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Remember me',
                        style: TextFontStyle.headline12w400cF1F1F1styleLexend
                            .copyWith(
                              color: AppColors.c737373,
                              fontSize: 10.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => nav.toForgotPassEmail(),
                  child: Text(
                    'Forgot password?',
                    style: TextFontStyle.headline12w400cF1F1F1styleLexend
                        .copyWith(color: AppColors.c737373, fontSize: 10.sp),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildSignInButton() {
    return Consumer<LoginViewModel>(
      builder: (context, vm, _) {
        return GestureDetector(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              final phone = _phoneController.text.trim();
              final password = _passwordController.text;

              bool success = await vm.signIn(
                phone: phone,
                password: password,
                context: context,
              );
              if (success) {
                vm.checklogin(true); // <-- Tell the provider you're logged in
                nav.goBack(); // <-- Go back to AccountScreen
              }

              // if (vm.errorMessage != null) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text(vm.errorMessage!)),
              //   );
              // } else {
              //   // Navigate to home or dashboard
              // }
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.sp),
            decoration: ShapeDecoration(
              color: AppColors.c2A3A8F,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            child: Center(
              child: Text(
                'Sign In',
                style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
                  color: AppColors.cFFFFFF,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AuthIconButton extends StatelessWidget {
  const AuthIconButton({super.key, required this.image, required this.label});

  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 44,
      padding: EdgeInsets.all(16.sp),
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F8FB),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.40, color: const Color(0xFFACB7BD)),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 24.h, width: 24.w),
          UIHelper.horizontalSpaceSmall,
          Text(
            label,
            style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
              color: AppColors.cAFAFAF,
            ),
          ),
        ],
      ),
    );
  }
}
