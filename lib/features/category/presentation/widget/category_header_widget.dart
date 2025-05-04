import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/localization/language_helper.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryHeaderWidget extends StatelessWidget {
  const CategoryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 10.h,
            bottom: 40.h,
            left: 16.w,
            right: 16.w,
          ),
          decoration: BoxDecoration(color: AppColors.c3BA4D2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: SvgPicture.asset(
                      Assets.icons.menu,
                      color: AppColors.cFFFFFF,
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              Text(
                "Category".tr,
                textAlign: TextAlign.center,
                style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.cFFFFFF,
                ),
              ),
              GestureDetector(
                onTap: () => nav.toNotification(),
                child: SvgPicture.asset(
                  Assets.icons.notification,
                  color: AppColors.cFFFFFF,
                  height: 24.h,
                  width: 24.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -25.h, // Adjust positioning instead of Transform.translate
          left: 16.w,
          right: 16.w,
          child: GestureDetector(
            onTap: () => nav.toSearch(),
            child: Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: AppColors.cFAFAFA,
                border: Border.all(color: AppColors.cF0F0F0),
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.icons.search),
                  UIHelper.horizontalSpaceSmall,
                  Text(
                    'Search by name, brand ...',
                    style: TextFontStyle.headline12w300cB6B6B6styleLexend,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
