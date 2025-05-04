import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  // final CategoryResponseModel category;
  final String image;
  final String label;

  final VoidCallback onTap;
  final Color color;
  final Color borderColor;

  const CategoryItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.label,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(color: color),
        padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            ClipOval(
              child: CustomNetworkImageWidget(
                urls: "$imageUrl$image",
                fit: BoxFit.cover,
                height: 40.h,
                width: 40.w,
              ),
            ),
            UIHelper.verticalSpaceSmall,
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextFontStyle.headline12w400cF1F1F1styleLexend,
            ),
            UIHelper.verticalSpace(5.h),
            Container(
              width: 73.w,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: borderColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
