// ignore_for_file: deprecated_member_use

import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/view_model/account_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final accountViewModel = context.watch<AccountViewModel>();
    final accountData = accountViewModel.accountData;

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.c202020,
        leading: GestureDetector(
          onTap: () => nav.goBack(),
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          'Account Details',
          textAlign: TextAlign.center,
          style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
            fontSize: 20.sp,
            color: AppColors.c202020,
          ),
        ),
        centerTitle: true,
      ),
      body:
          accountData == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: const BoxDecoration(
                                color: AppColors.c1F1F1F,
                                shape: BoxShape.circle,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    accountData.userName,
                                    style: TextFontStyle
                                        .headline12w500c0C89BFstyleLexend
                                        .copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.c1F1F1F,
                                        ),
                                  ),
                                  Text(
                                    accountData.userEmail == "null"
                                        ? "Email Not Provided"
                                        : accountData.userEmail,
                                    style: TextFontStyle
                                        .headline12w400cF1F1F1styleLexend
                                        .copyWith(color: AppColors.cB6B6B6),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceMedium,
                        _buildLabelValue("Full Name", accountData.userName),
                        UIHelper.verticalSpaceMediumLarge,
                        _buildLabelValue("Phone Number", accountData.userPhone),
                        UIHelper.verticalSpaceMediumLarge,
                        _buildLabelValue(
                          "Email Address",
                          accountData.userEmail == "null"
                              ? "Email Not Provided"
                              : accountData.userEmail,
                        ),
                        UIHelper.verticalSpaceMediumLarge,
                        // _buildLabelValue("Gender", accountData.gender),
                        // UIHelper.verticalSpaceMediumLarge,
                        // _buildLabelValue(
                        //     "Date of Birth", accountData.dateOfBirth),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => nav.toUpdateAccountInfo(),
                      child: Container(
                        margin: EdgeInsets.all(10.sp),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        width: double.infinity,
                        height: 44.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF148ABF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Update Information',
                            style: TextFontStyle
                                .headline12w400cF1F1F1styleLexend
                                .copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.cFFFFFF,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildLabelValue(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
            fontSize: 14.sp,
            color: AppColors.c1F1F1F.withOpacity(.8),
          ),
        ),
        UIHelper.verticalSpace(8.h),
        Text(
          value ?? "",
          style: TextFontStyle.headline12w500c0C89BFstyleLexend.copyWith(
            color: AppColors.c1F1F1F,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
