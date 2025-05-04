import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/category_response_model.dart';
import 'package:feature_based_mvvm_architecture/features/category/presentation/widget/category_header_widget.dart';
import 'package:feature_based_mvvm_architecture/features/category/presentation/widget/category_shimmer_effect_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedCategory = 0;
  String title = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            CategoryHeaderWidget(),
            UIHelper.verticalSpace(40.h),
            Container(
              padding: EdgeInsets.all(10.sp),
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.cF3FEEF),
              child: Text(
                'Free Shipping on all choice items',
                textAlign: TextAlign.center,
                style: TextFontStyle.headline12w300cB6B6B6styleLexend.copyWith(
                  color: AppColors.c202020,
                ),
              ),
            ),

            StreamBuilder<List<CategoryResponseModel>>(
              stream: null,
              builder: (context, snapshot) {
                return CategoryShimmerEffectWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
