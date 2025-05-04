import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/view_model/home_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CatagoryGridviewWidget extends StatefulWidget {
  const CatagoryGridviewWidget({super.key});

  @override
  State<CatagoryGridviewWidget> createState() => _CatagoryGridviewWidgetState();
}

class _CatagoryGridviewWidgetState extends State<CatagoryGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    // final childAspectRatio = width < 400 ? 0.62 : .7;
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return Column(
          children: [
            _SectionTitle(title: 'Best Sub-categories', onSeeAll: null),
            UIHelper.verticalSpace(14.h),
            StreamBuilder(
              stream: null,
              builder: (context, snapshot) {
                return const _CatagoryShimmerGrid();
              },
            ),
          ],
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const _SectionTitle({required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSeeAll,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              fontSize: 16.sp,
              color: AppColors.c1F1F1F,
            ),
          ),
          Row(
            children: [
              Text(
                'See all',
                style: TextFontStyle.headline12w500c0C89BFstyleLexend.copyWith(
                  color: AppColors.primaryColor.withOpacity(0.7),
                ),
              ),
              UIHelper.horizontalSpace(5.w),
              Icon(
                Icons.arrow_forward,
                color: AppColors.primaryColor,
                size: 14.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CatagoryItemCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String discount;
  final VoidCallback onTap;

  const CatagoryItemCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.discount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          border: Border.all(color: AppColors.cF0F0F0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomNetworkImageWidget(
              urls: imageUrl + image,
              width: width < 390 ? 110.w : 135.w,
              height: width < 390 ? 120.w : 150.h,
              fit: BoxFit.cover,
            ),
            UIHelper.verticalSpaceSmall,
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                fontSize: 12.sp,
              ),
            ),
            UIHelper.verticalSpace(7.h),
          ],
        ),
      ),
    );
  }
}

class _CatagoryShimmerGrid extends StatelessWidget {
  const _CatagoryShimmerGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.78,
          ),
          itemBuilder:
              (_, __) => Container(
                margin: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
        ),
      ],
    );
  }
}
