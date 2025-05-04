import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/shimmer_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalsListviewWidget extends StatefulWidget {
  const NewArrivalsListviewWidget({super.key});

  @override
  State<NewArrivalsListviewWidget> createState() =>
      _NewArrivalsListviewWidgetState();
}

class _NewArrivalsListviewWidgetState extends State<NewArrivalsListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return Column(
            children: [
              _buildSectionHeader(onTap: null),
              UIHelper.verticalSpace(14.h),
              _buildShimmerList(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Best Selling',
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              fontSize: 16.sp,
              color: AppColors.c1F1F1F,
            ),
          ),
          Row(
            children: [
              Text(
                'See all',
                style: TextFontStyle.headline12w500c0C89BFstyleLexend,
              ),
              UIHelper.horizontalSpace(5.w),
              SizedBox(
                height: 14.h,
                width: 14.w,
                child: Image.asset(
                  Assets.icons.backArrow.path,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => UIHelper.horizontalSpaceSmall,
        itemBuilder: (context, index) => const ShimmerItemCardWidget(),
      ),
    );
  }
}
