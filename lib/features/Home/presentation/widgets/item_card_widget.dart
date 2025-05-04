import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.currentPrice,
    required this.oldPrice,
    required this.ratting,
    required this.review,
    required this.offer,
    this.onAddTap,
    this.onCardTap,
    this.onWislistTap,
    required this.isFavourite,
  });

  final String image;
  final String name;
  final String currentPrice;
  final String oldPrice;
  final double ratting;
  final String review;
  final String offer;
  final VoidCallback? onAddTap;
  final VoidCallback? onCardTap;
  final VoidCallback? onWislistTap;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        width: 150.w,
        padding: EdgeInsets.all(7.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          border: Border.all(color: AppColors.cF0F0F0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CustomNetworkImageWidget(
                  urls: imageUrl + image,
                  width: 150.w,
                  height: 160.h,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.sp),
                      margin: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                      child: Text(
                        offer,
                        overflow: TextOverflow.ellipsis,
                        style: TextFontStyle.headline12w400cF1F1F1styleLexend
                            .copyWith(fontSize: 7.sp),
                      ),
                    ),
                    GestureDetector(
                      onTap: onWislistTap,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: SizedBox(
                          height: 18.h,
                          width: 18.w,
                          child: SvgPicture.asset(
                            isFavourite
                                ? Assets.icons.favouriteFill
                                : Assets.icons.favourite,
                            color: AppColors.secondaryColor,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            UIHelper.verticalSpace(7.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextFontStyle.headline12w400cF1F1F1styleLexend
                      .copyWith(
                        // fontSize: 9.sp,
                        height: 1.40,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Row(
                              children: [
                                Text(
                                  '৳ $currentPrice ',
                                  style: TextFontStyle
                                      .headline12w400cF1F1F1styleLexend
                                      .copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  '৳ $oldPrice',
                                  style: TextFontStyle
                                      .headline12w400cF1F1F1styleLexend
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 10.sp,
                                        color: AppColors.c1F1F1F.withOpacity(
                                          .5,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              StarRating(
                                size: 15.sp,
                                rating: ratting,
                                allowHalfRating: false,
                              ),
                              Text(
                                ' ($review)',
                                style: TextFontStyle
                                    .headline12w300cB6B6B6styleLexend
                                    .copyWith(fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onAddTap,
                      child: Image.asset(
                        Assets.images.addItem.path,
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
