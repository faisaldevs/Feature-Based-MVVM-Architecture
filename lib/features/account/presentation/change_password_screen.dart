import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.c202020,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => nav.goBack(),
        ),
        title: Text(
          'Update Account',
          style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
            fontSize: 20.sp,
            color: AppColors.c202020,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPasswordField('Current Password', _oldPasswordController),
            UIHelper.verticalSpaceMedium,
            _buildPasswordField('New Password', _newPasswordController),
            UIHelper.verticalSpaceMedium,
            _buildPasswordField(
              'Confirm New Password',
              _confirmPasswordController,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildSaveButton(context),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
            color: AppColors.c202020,
          ),
        ),
        UIHelper.verticalSpace(8.h),
        CustomFormField(
          controller: controller,
          fillColor: AppColors.cF3F3F3,
          borderRadius: 2.r,
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return GestureDetector(
      onTap: () => nav.goBack(),
      child: Container(
        margin: EdgeInsets.all(10.sp),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        width: double.infinity,
        height: 44.h,
        decoration: BoxDecoration(
          color: const Color(0xFF148ABF),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Center(
          child: Text(
            'Save',
            style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
              fontSize: 14.sp,
              color: AppColors.cFFFFFF,
            ),
          ),
        ),
      ),
    );
  }
}
