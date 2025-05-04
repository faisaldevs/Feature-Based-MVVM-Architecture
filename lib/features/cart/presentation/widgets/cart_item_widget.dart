import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/widgets/holdable_custom_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.productName,
    required this.currentPrice,
    required this.oldPrice,
    required this.image,
    required this.quantity,
    required this.itemIndex,
    required this.itemId,
  });

  final String productName;
  final String currentPrice;
  final String oldPrice;
  final String image;
  final int quantity;
  final int itemIndex;
  final int itemId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(14.sp),
      decoration: ShapeDecoration(
        color: AppColors.cFFFFFF,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.sp, color: const Color(0xFFE8E8E8)),
          borderRadius: BorderRadius.circular(2),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Container(
          //   width: 90.w,
          //   height: 94.h,
          //   decoration: ShapeDecoration(
          //     color: const Color(0xFFCACACA),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(2)),
          //   ),
          // ),
          CustomNetworkImageWidget(
            urls: imageUrl + image,
            width: 90.w,
            height: 94.h,
            fit: BoxFit.contain,
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: SizedBox(
              height: 94.h,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextFontStyle
                                    .headline12w400cF1F1F1styleLexend
                                    .copyWith(fontSize: 14.sp),
                              ),
                              UIHelper.verticalSpace(10.h),
                              Text(
                                '৳  $currentPrice',
                                style: TextFontStyle
                                    .headline12w400cF1F1F1styleLexend
                                    .copyWith(
                                      fontSize: 14.sp,
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Consumer<CartViewModel>(
                        builder: (context, provider, _) {
                          return Checkbox(
                            activeColor: AppColors.primaryColor,
                            value: provider.isSelected(itemId),
                            onChanged: (value) {
                              provider.toggleSelection(itemId, value!);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Consumer<CartViewModel>(
                      builder: (context, provider, _) {
                        return Container(
                          padding: EdgeInsets.all(4.sp),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.black.withValues(alpha: 128),
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Row(
                            children: [
                              HoldableIconButton(
                                size: 16.sp,
                                onPressed:
                                    () => provider.decreaseQuantity(itemId),
                                icon: Icons.remove,
                              ),
                              UIHelper.horizontalSpace(5.h),
                              Text(
                                provider.getQuantity(itemId).toString(),
                                style: TextFontStyle
                                    .headline12w400cF1F1F1styleLexend
                                    .copyWith(
                                      color: AppColors.c1F1F1F,
                                      fontSize: 16.sp,
                                    ),
                              ),
                              UIHelper.horizontalSpace(5.h),
                              // GestureDetector(
                              //   onTap: () => provider.counterAdd(),
                              //   child: Icon(
                              //     Icons.add,
                              //     size: 24.sp,
                              //   ),
                              // ),
                              HoldableIconButton(
                                size: 16.sp,
                                onPressed:
                                    () => provider.increaseQuantity(itemId),
                                icon: Icons.add,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
