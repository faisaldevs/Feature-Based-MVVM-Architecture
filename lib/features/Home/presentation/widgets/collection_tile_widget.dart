import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/view_model/home_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/shimmer_widget.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/category_response_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CollectionTileWidget extends StatefulWidget {
  const CollectionTileWidget({super.key});

  @override
  State<CollectionTileWidget> createState() => _CollectionTileWidgetState();
}

class _CollectionTileWidgetState extends State<CollectionTileWidget> {
  final ScrollController scrollCnt = ScrollController();
  int currentIndex = 0;
  int currentPage = 0;
  final int itemCount = 50;
  final double itemWidth = 160.0;
  final int itemsPerPage = 8;

  String selectedItem = "All";
  int? selectedId;

  @override
  void dispose() {
    scrollCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<List<CategoryResponseModel>>(
          stream: null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(6, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        width: 80.w,
                        height: 30.h,
                      ),
                    );
                  }),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No categories available.'));
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(snapshot.data?.length ?? 0, (index) {
                  List<CategoryResponseModel>? items = snapshot.data;
                  bool isSelected = selectedItem == items?[index].name;

                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? AppColors.primaryColor
                                : AppColors.cF3F3F3,
                        // gradient: isSelected
                        //     ? LinearGradient(
                        //         begin: Alignment.topCenter,
                        //         end: Alignment.bottomCenter,
                        //         colors: [
                        //           Color(0XFFAAE5FF),
                        //           Color(0XFF0C89BF),
                        //         ],
                        //       )
                        //     : null,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Text(
                        items![index].name!,
                        textAlign: TextAlign.center,
                        style: TextFontStyle.headline12w500c0C89BFstyleLexend
                            .copyWith(
                              color:
                                  isSelected
                                      ? AppColors.cFFFFFF
                                      : AppColors.c1F1F1F,
                            ),
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
        UIHelper.verticalSpaceMedium,
        Consumer<HomeViewModel>(
          builder: (context, vm, _) {
            return InkWell(onTap: null, child: headerRow());
          },
        ),
        UIHelper.verticalSpaceSmall,
        StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            return GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ShimmerItemCardWidget();
              },
            );
          },
        ),
      ],
    );
  }

  Widget headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '$selectedItem Collection',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              fontSize: 16.sp,
              color: AppColors.c1F1F1F,
            ),
          ),
        ),
        UIHelper.horizontalSpaceSemiLarge,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'See all',
              textAlign: TextAlign.center,
              style: TextFontStyle.headline12w500c0C89BFstyleLexend,
            ),
            UIHelper.horizontalSpace(5.w),
            Icon(Icons.arrow_forward, color: AppColors.c0C89BF),
          ],
        ),
      ],
    );
  }
}
