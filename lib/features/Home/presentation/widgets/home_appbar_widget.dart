import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/home_slider_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: SvgPicture.asset(
                    Assets.icons.menu,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Image.asset(
              Assets.icons.bdbeponiLogo.path,
              height: 31.h,
              fit: BoxFit.cover,
            ),
            GestureDetector(
              onTap: () => nav.toNotification(),
              child: SvgPicture.asset(
                Assets.icons.notification,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        // ---------- search bar -------------
        UIHelper.verticalSpace(14.h),

        GestureDetector(
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

        UIHelper.verticalSpace(14.h),
        CustomCarouselSlider(), // Home Slider 1 widget
        UIHelper.verticalSpace(14.h),
      ],
    );
  }
}
