import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view_model/login_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/common_widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgotPassEmailScreen extends StatefulWidget {
  const ForgotPassEmailScreen({super.key});

  @override
  State<ForgotPassEmailScreen> createState() => _ForgotPassEmailScreenState();
}

class _ForgotPassEmailScreenState extends State<ForgotPassEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Kindly enter a valid phone number..';
    }
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
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
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(fontSize: 30.sp, color: AppColors.c2A3A8F),
                ),
                UIHelper.verticalSpace(14.h),
                Text(
                  'No worries, we’re here to help you recover it anytime!',
                  style: TextFontStyle.headline12w400cF1F1F1styleLexend
                      .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c202020,
                        height: 1.40,
                      ),
                ),
                UIHelper.verticalSpace(34.h),
                _buildPhoneField(),
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

  Widget _buildSignInButton() {
    return Consumer<LoginViewModel>(
      builder: (context, vm, _) {
        return GestureDetector(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              nav.toForgotPassEmailOtp();
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
