import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurOffersWidget extends StatelessWidget {
  const OurOffersWidget({super.key, required this.offerText});

  final List offerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: Stack(
        children: [
          // Background Image
          Image.asset(
            Assets.images.homeOfferBg.path,
            height: 44.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // ListView for dynamic offers
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(offerText.length, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      offerText[index][0],
                      style: TextFontStyle.headline12w400cF1F1F1styleLexend
                          .copyWith(fontSize: 8.sp),
                    ),
                    UIHelper.verticalSpace(5.h),
                    Text(
                      offerText[index][0],
                      style: TextFontStyle.headline12w400cF1F1F1styleLexend
                          .copyWith(fontSize: 7.sp),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
