import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BrandSliderWidget extends StatelessWidget {
  const BrandSliderWidget({super.key, required this.items});

  final List items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.cF0F0F0),
              ),
              child: SvgPicture.asset(Assets.icons.xiaomi),
            ),
          );
        }),
      ),
    );
  }
}
