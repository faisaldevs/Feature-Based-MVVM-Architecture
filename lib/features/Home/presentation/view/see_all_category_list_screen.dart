// ignore_for_file: deprecated_member_use

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/database/model/cart/cart_items.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/all_sub_category_response_model.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/shimmer_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_dropdown_button.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SeeAllCategoryListScreen extends StatelessWidget {
  const SeeAllCategoryListScreen({super.key, required this.items, this.title});

  final List<AllSubCategoryResponseModel> items;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.c202020,
        leading: GestureDetector(
          onTap: () => nav.goBack(),
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: SizedBox(
          width: 180.w,
          child: Text(
            title ?? "More Products",
            textAlign: TextAlign.center,
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              fontSize: 20.sp,
              color: AppColors.c202020,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: SvgPicture.asset(
              Assets.icons.filter,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
              color: AppColors.c202020,
            ),
          ),
          UIHelper.horizontalSpaceSmall,

          // GestureDetector(
          //   onTap: () {},
          //   child: SvgPicture.asset(
          //     Assets.icons.cart,
          //     height: 24.h,
          //     width: 24.w,
          //     fit: BoxFit.contain,
          //     color: AppColors.c202020,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: ValueListenableBuilder(
              valueListenable: hiveBox.listenable(),
              builder: (context, Box box, _) {
                final cartItems =
                    (box.get(kKeyCartItems, defaultValue: []) as List)
                        .cast<CartItems>();
                return Badge.count(
                  count: cartItems.length,
                  child: GestureDetector(
                    onTap: () => nav.toNavigation(index: 2),
                    child: SvgPicture.asset(
                      Assets.icons.cart,
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                      color: AppColors.c202020,
                    ),
                  ),
                );
              },
            ),
          ),

          UIHelper.horizontalSpaceSmall,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomDropdownButton(
              borderColor: AppColors.cF6F6F6,
              borderWidth: 2.w,
              items: ["Relevance", "Price Low to High", "Price High to Low"],
              selectedValue: "Relevance",
              isFilled: true,
              borderRadius: 2.r,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 10.w, // Space between columns
                mainAxisSpacing: 10.h, // Space between rows
                childAspectRatio: 0.64, // Adjust based on item content
              ),
              itemCount: 10, // Add the correct item count here
              shrinkWrap: true, // Prevents excessive height calculation
              physics: BouncingScrollPhysics(), // Smooth scrolling
              itemBuilder: (context, index) {
                return ShimmerItemCardWidget();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
