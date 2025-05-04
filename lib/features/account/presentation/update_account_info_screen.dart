import 'dart:io';

import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/view_model/account_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/image_picker.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateAccountInfoScreen extends StatefulWidget {
  const UpdateAccountInfoScreen({super.key});

  @override
  State<UpdateAccountInfoScreen> createState() =>
      _UpdateAccountInfoScreenState();
}

class _UpdateAccountInfoScreenState extends State<UpdateAccountInfoScreen> {
  final nameCnt = TextEditingController();
  final emailCnt = TextEditingController();
  final phoneCnt = TextEditingController();
  final countryCnt = TextEditingController();
  final zipCnt = TextEditingController();
  final deliveryAddressCnt = TextEditingController();
  final ValueNotifier<File?> image = ValueNotifier<File?>(null);

  @override
  void initState() {
    super.initState();

    final accountViewModel = context.read<AccountViewModel>();
    final accountData = accountViewModel.accountData;

    if (accountData != null) {
      nameCnt.text = accountData.userName;
      emailCnt.text = accountData.userEmail;
      phoneCnt.text = accountData.userPhone;
      // countryCnt.text = accountData.country ?? "";
      // zipCnt.text = accountData.zipCode ?? "";
      // deliveryAddressCnt.text = accountData.deliveryAddress ?? "";

      // if (accountData.profileImagePath != null) {
      //   image.value = File(accountData.profileImagePath!);
      // }
    }
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    nameCnt.dispose();
    emailCnt.dispose();
    phoneCnt.dispose();
    countryCnt.dispose();
    zipCnt.dispose();
    deliveryAddressCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountViewModel = context.read<AccountViewModel>();
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
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          'Update Account',
          textAlign: TextAlign.center,
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
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showPickImageBottomSheetImage(context, image);
                  },
                  child: ValueListenableBuilder(
                    builder: (context, img, __) {
                      return SizedBox(
                        width: 75.w,
                        height: 75.h,
                        child: Stack(
                          children: [
                            img == null || img.path.isEmpty
                                ? Container(
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.c1F1F1F,
                                    shape: BoxShape.circle,
                                  ),
                                )
                                : Image.file(img),
                            Positioned(
                              bottom: 16.h,
                              right: 10.w,
                              child: Image.asset(
                                Assets.icons.editProfile.path,
                                height: 24.h,
                                width: 24.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    valueListenable: image,
                  ),
                ),
                UIHelper.horizontalSpaceSmall,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accountData?.userName ?? "Khan Mohammad Iqra",
                        textAlign: TextAlign.center,
                        style: TextFontStyle.headline12w500c0C89BFstyleLexend
                            .copyWith(
                              fontSize: 14.sp,
                              color: AppColors.c1F1F1F,
                            ),
                      ),
                      Text(
                        accountData?.userPhone ?? "mohammadiqra@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextFontStyle.headline12w400cF1F1F1styleLexend
                            .copyWith(color: AppColors.cB6B6B6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpaceMedium,
            Text(
              "Full Name",
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                color: AppColors.c202020,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomFormField(
              controller: nameCnt,
              fillColor: AppColors.cF3F3F3,
              borderRadius: 2.r,
            ),
            UIHelper.verticalSpaceMedium,
            Text(
              "Email Address",
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                color: AppColors.c202020,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomFormField(
              controller: emailCnt,
              fillColor: AppColors.cF3F3F3,
              borderRadius: 2.r,
            ),
            UIHelper.verticalSpaceMedium,
            // Text(
            //   "Gender",
            //   style: TextFontStyle.headline12w400cF1F1F1styleLexend
            //       .copyWith(color: AppColors.c202020),
            // ),
            // UIHelper.verticalSpace(8.h),
            // SizedBox(
            //   width: double.infinity,
            //   child: CustomDropdownButton(
            //     borderRadius: 2.r,
            //     borderColor: AppColors.cACB7BD,
            //     fillColor: AppColors.cF3F3F3,
            //     items: ["Male", "Female"],
            //     isFilled: true,
            //     onChanged: (value) {},
            //   ),
            // ),
            // UIHelper.verticalSpaceMedium,
            Text(
              "Phone Number",
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                color: AppColors.c202020,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            // GestureDetector(
            //   onTap: () {},
            //   child: AbsorbPointer(
            //     child: CustomFormField(
            //       suffixIcon: Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: SvgPicture.asset(Assets.icons.calender),
            //       ),
            //       controller: emailCnt,
            //       fillColor: AppColors.cF3F3F3,
            //       borderRadius: 2.r,
            //     ),
            //   ),
            // ),
            AbsorbPointer(
              child: CustomFormField(
                inputType: TextInputType.none,
                controller: phoneCnt,
                fillColor: AppColors.cF3F3F3,
                isRead: true,
                borderRadius: 2.r,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => nav.goBack(),
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
              'Save',
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                fontSize: 14.sp,
                color: AppColors.cFFFFFF,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
