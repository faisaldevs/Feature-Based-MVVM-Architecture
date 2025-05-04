import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  // final CategoryResponseModel category;
  final String image;
  final String label;

  final VoidCallback onTap;

  const SubCategoryItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.w,
        decoration: BoxDecoration(color: AppColors.cFFFFFF),
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
            UIHelper.verticalSpace(5.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextFontStyle.headline12w400cF1F1F1styleLexend,
            ),
          ],
        ),
      ),
    );
  }
}
