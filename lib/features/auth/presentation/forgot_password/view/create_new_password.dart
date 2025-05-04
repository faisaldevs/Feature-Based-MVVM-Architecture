import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/forgot_password/view_model/forgot_pass_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view_model/login_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/common_widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  'Create a New Password',
                  textAlign: TextAlign.left,
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(fontSize: 30.sp, color: AppColors.c2A3A8F),
                ),
                UIHelper.verticalSpace(14.h),
                Text(
                  "Your account's security is our priority.",
                  style: TextFontStyle.headline12w400cF1F1F1styleLexend
                      .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c202020,
                        height: 1.40,
                      ),
                ),
                UIHelper.verticalSpace(34.h),
                _buildPassField(),
                UIHelper.verticalSpace(22.h),
                _buildSignInButton(),
                UIHelper.verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassField() {
    return Consumer<ForgotPassViewModel>(
      builder: (context, vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Password',
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
            UIHelper.verticalSpaceMedium,
            Text(
              'Confirm New Password',
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                color: AppColors.c202020,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomFormField(
              isPass: true,
              borderRadius: 3.sp,
              isObsecure: vm.isObscure2,
              suffixIcon: GestureDetector(
                onTap: () => vm.toggleObscure2(),
                child: Icon(
                  vm.isObscure2 ? Icons.visibility : Icons.visibility_off,
                  size: 21.sp,
                ),
              ),
              fillColor: AppColors.cF7F8FB,
              textInputAction: TextInputAction.done,
              controller: _confirmPasswordController,
              validator: _validatePassword,
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
              nav.go("/login");
              //   final phone = _phoneController.text.trim();

              //   bool success = await vm.signIn(
              //       phone: phone, password: password, context: context);
              //   if (success) {
              //     vm.checklogin(true); // <-- Tell the provider you're logged in
              //     nav.goBack(); // <-- Go back to AccountScreen
              //   }

              //   // if (vm.errorMessage != null) {
              //   //   ScaffoldMessenger.of(context).showSnackBar(
              //   //     SnackBar(content: Text(vm.errorMessage!)),
              //   //   );
              //   // } else {
              //   //   // Navigate to home or dashboard
              //   // }
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
                'Submit',
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
