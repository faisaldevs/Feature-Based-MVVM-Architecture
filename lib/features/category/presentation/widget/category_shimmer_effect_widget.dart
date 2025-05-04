import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerEffectWidget extends StatelessWidget {
  const CategoryShimmerEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          // Category list (Sidebar)
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: List.generate(
                10,
                (index) => Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: index == 0 ? AppColors.cFFFFFF : AppColors.cF6F6F6,
                  ),
                  padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade100,
                        child: Text(
                          "Loading...",
                          textAlign: TextAlign.center,
                          style: TextFontStyle.headline12w400cF1F1F1styleLexend,
                        ),
                      ),
                      UIHelper.verticalSpace(5.h),
                      Container(
                        width: 73.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: .5,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE4E4E4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Category details (Main content)
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.all(24.sp),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 15.h,
                    spacing: 10.sp,
                    children: List.generate(15, (index) {
                      return Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceSmall,
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.grey.shade100,
                            child: Text(
                              "Loading...",
                              textAlign: TextAlign.center,
                              style:
                                  TextFontStyle
                                      .headline12w400cF1F1F1styleLexend,
                            ),
                          ),
                          UIHelper.verticalSpace(5.h),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
