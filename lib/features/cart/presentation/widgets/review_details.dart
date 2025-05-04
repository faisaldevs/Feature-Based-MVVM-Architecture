import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewDetails extends StatefulWidget {
  const ReviewDetails({super.key});

  @override
  State<ReviewDetails> createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
  Widget _buildButton(
    String text, {
    bool primary = false,
    VoidCallback? onTap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primary ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(2.sp),
          border: Border.all(color: AppColors.cF0F0F0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null
                ? SizedBox.shrink()
                : Icon(icon, color: AppColors.primaryColor),
            UIHelper.horizontalSpace(5.w),
            Text(
              text,
              style: TextFontStyle.headline12w500c0C89BFstyleLexend.copyWith(
                color: primary ? AppColors.cFFFFFF : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isAddress = false}) {
    return Row(
      crossAxisAlignment:
          isAddress ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextFontStyle.headline12w300cB6B6B6styleLexend),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextFontStyle.headline12w300cB6B6B6styleLexend.copyWith(
              color: AppColors.c1F1F1F,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Details Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details',
                style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.c202020,
                ),
              ),
              UIHelper.verticalSpaceMedium,
              Container(
                padding: EdgeInsets.all(14.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.sp),
                  border: Border.all(
                    color: const Color(0xFFE8E8E8),
                    width: 0.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Order Id', '#1814'),
                    UIHelper.verticalSpace(15.h),
                    _buildDetailRow('Product name', 'Vivo Y29 6GB/128GB'),
                    UIHelper.verticalSpace(15.h),
                    _buildDetailRow('Order placed on', '24-03-2025'),
                    UIHelper.verticalSpace(15.h),
                    _buildDetailRow('Estimated delivery', '27-03-2025'),
                    UIHelper.verticalSpace(15.h),
                    _buildDetailRow("Delivery type", 'Cash'),
                    UIHelper.verticalSpace(15.h),
                    _buildDetailRow("Total Amount", '74,100'),
                    UIHelper.verticalSpace(15.h),
                    _buildDetailRow(
                      'Shipping address',
                      'House: B/158, Road: 22, Mohakhali DOHS, Dhaka',
                      isAddress: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium,

          // Action Buttons Section
          Column(
            children: [
              _buildButton(
                'Download Invoice',
                onTap: () => nav.goBack(),
                icon: Icons.file_download,
              ),
              UIHelper.verticalSpaceSmall,
              _buildButton(
                'Return to Home',
                primary: true,
                onTap: () => nav.toNavigation(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
