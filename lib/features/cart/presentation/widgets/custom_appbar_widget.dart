import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final int cartItemCount;
  final VoidCallback onWishlistTap;
  final VoidCallback? onDeleteTap;
  final bool showDeleteIcon;

  const CustomAppBar({
    super.key,
    required this.cartItemCount,

    required this.onWishlistTap,
    this.onDeleteTap,
    this.showDeleteIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      // color: AppColors.cFFFFFF,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Leading - Drawer icon
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

          /// Title - Center
          Expanded(
            child: Center(
              child: Text(
                'Cart ($cartItemCount)',
                style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.c202020,
                ),
              ),
            ),
          ),

          /// Actions - Wishlist & Delete
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onWishlistTap,
                child: SvgPicture.asset(
                  Assets.icons.favourite,
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.c202020,
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              if (showDeleteIcon)
                GestureDetector(
                  onTap: onDeleteTap,
                  child: SvgPicture.asset(
                    Assets.icons.deleteIcon,
                    height: 24.h,
                    width: 24.w,
                    color: AppColors.c202020,
                  ),
                ),
              if (showDeleteIcon) UIHelper.horizontalSpaceSmall,
            ],
          ),
        ],
      ),
    );
  }
}
