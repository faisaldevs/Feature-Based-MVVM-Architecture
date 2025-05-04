import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view_model/login_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ForgotPassEmailOTPScreen extends StatefulWidget {
  const ForgotPassEmailOTPScreen({super.key});

  @override
  State<ForgotPassEmailOTPScreen> createState() =>
      _ForgotPassEmailOTPScreenState();
}

class _ForgotPassEmailOTPScreenState extends State<ForgotPassEmailOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
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
                  'Phone Number Verification',
                  textAlign: TextAlign.left,
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(fontSize: 30.sp, color: AppColors.c2A3A8F),
                ),
                UIHelper.verticalSpace(14.h),
                Text(
                  'Verification code has been sent to your provided phone number.',
                  style: TextFontStyle.headline12w400cF1F1F1styleLexend
                      .copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c202020,
                        height: 1.40,
                      ),
                ),
                UIHelper.verticalSpace(34.h),
                _buildOTPField(),
                UIHelper.verticalSpace(22.h),
                _buildSubmitButton(),
                UIHelper.verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildOTPField() {
  //   return Center(
  //     child: Pinput(
  //       controller: _otpController,

  //       length: 4,
  //       defaultPinTheme: PinTheme(
  //           width: 50.w,
  //           height: 50.h,
  //           textStyle: TextFontStyle.headline12w300cB6B6B6styleLexend.copyWith(
  //             fontSize: 16.sp,
  //             color: AppColors.c202020,
  //           ),
  //           decoration: BoxDecoration(
  //             color: Color(0xFFF7F8FB),
  //             border: Border.all(
  //               color: Color(0xFFACB7BD),
  //             ),
  //             borderRadius: BorderRadius.circular(2.r),
  //           ),
  //           margin: EdgeInsets.symmetric(horizontal: 10.w)),
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'OTP is required';
  //         }
  //         return null;
  //       },
  //       pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
  //       showCursor: true,
  //       onCompleted: (pin) => log('Entered OTP: $pin'),
  //     ),
  //   );
  // }

  Widget _buildOTPField() {
    return Center(
      child: FormField<String>(
        validator: (value) {
          if (_otpController.text.isEmpty) {
            return 'OTP is required';
          }
          return null;
        },
        builder:
            (field) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Pinput(
                  controller: _otpController,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle: TextFontStyle.headline12w300cB6B6B6styleLexend
                        .copyWith(fontSize: 16.sp, color: AppColors.c202020),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FB),
                      border: Border.all(color: const Color(0xFFACB7BD)),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                  pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                  onChanged: (value) {
                    field.didChange(value);
                  },
                  showCursor: true,
                ),
                if (field.hasError)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      field.errorText!,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    ),
                  ),
              ],
            ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Consumer<LoginViewModel>(
      builder: (context, vm, _) {
        return GestureDetector(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              nav.toCreateNewPass();
              //   final otp = _otpController.text.trim();
              //   FocusScope.of(context).unfocus(); // Close keyboard

              //   vm.setLoading(true); // You can add this in LoginViewModel
              //   bool success = await vm.verifyForgotPasswordOtp(otp, context);
              //   vm.setLoading(false);

              //   if (success) {
              //     nav.toResetPasswordScreen(); // Navigate to reset password
              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(content: Text(vm.errorMessage ?? 'Verification failed')),
              //     );
              //   }
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.sp),
            decoration: ShapeDecoration(
              color: AppColors.c2A3A8F,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.r),
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
