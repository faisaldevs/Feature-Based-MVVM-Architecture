import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/signup/view_model/signup_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/common_widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _onSignUp(SignupViewModel vm) async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final phone = _phoneController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      await vm.signUp(
        name: name,
        phone: phone,
        password: password,
        email: email,
        context: context,
      );

      // if (success) {
      //   vm.checklogin(true);
      //   nav.toNavigation(); // or navigate to home/dashboard
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(vm.errorMessage ?? 'Sign up failed')),
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SignupViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.c202020,
        leading: GestureDetector(
          onTap: () => nav.toNavigation(),
          child: const Icon(Icons.arrow_back),
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
                  'Sign Up',
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(fontSize: 30.sp, color: AppColors.c1F1F1F),
                ),
                UIHelper.verticalSpace(34.h),
                _buildNormalField(
                  controller: _nameController,
                  label: "Full Name",
                  validator: _validateName,
                ),
                UIHelper.verticalSpace(16.h),
                _buildNormalField(
                  controller: _phoneController,
                  label: "Phone Number",
                  validator: _validatePhone,
                ),
                UIHelper.verticalSpace(16.h),
                _buildNormalField(
                  controller: _emailController,
                  label: "Email",
                  validator: _validateEmail,
                ),
                UIHelper.verticalSpace(16.h),
                _buildPasswordField(
                  id: 1,
                  controller: _passwordController,
                  label: "Password",
                  validator: _validatePassword,
                ),
                UIHelper.verticalSpace(16.h),
                _buildPasswordField(
                  id: 2,
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  validator: _validateConfirmPassword,
                ),
                UIHelper.verticalSpace(34.h),
                _buildSignUpButton(vm),
                UIHelper.verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => nav.toLogin(),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextFontStyle
                                  .headline12w400cF1F1F1styleLexend
                                  .copyWith(
                                    color: AppColors.c737373,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            TextSpan(
                              text: 'Sign In',
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

  Widget _buildSignUpButton(SignupViewModel vm) {
    return GestureDetector(
      onTap: () => _onSignUp(vm),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.sp),
        decoration: ShapeDecoration(
          color: AppColors.c2A3A8F,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              color: AppColors.cFFFFFF,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNormalField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
            color: AppColors.c202020,
          ),
        ),
        UIHelper.verticalSpaceSmall,
        CustomFormField(
          borderRadius: 3.sp,
          fillColor: AppColors.cF7F8FB,
          textInputAction: TextInputAction.next,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required int id,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
            color: AppColors.c202020,
          ),
        ),
        UIHelper.verticalSpaceSmall,
        Consumer<SignupViewModel>(
          builder: (context, vm, _) {
            return CustomFormField(
              isPass: true,
              borderRadius: 3.sp,
              isObsecure: vm.passConfig.contains(id),
              suffixIcon: GestureDetector(
                onTap: () => vm.togglePasswordConfig(id),
                child: Icon(
                  vm.passConfig.contains(id)
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 21.sp,
                ),
              ),
              fillColor: AppColors.cF7F8FB,
              textInputAction: TextInputAction.done,
              controller: controller,
              validator: _validatePassword,
            );
          },
        ),
      ],
    );
  }
}
